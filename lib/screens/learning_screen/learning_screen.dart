import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/contexts/dictionary_context.dart';
import '../../core/models/dictionary/dictionary.dart';
import '../../core/services/srs_service.dart';
import '../../core/srs/srs_item.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen>
    with TickerProviderStateMixin {
  int _currentWordIndex = 0;
  List<String> _sessionWords = [];
  late AnimationController _swipeController;
  late AnimationController _resetController;
  // Значения анимации для эффектов наподобие Tinder
  double _dragX = 0.0;
  double _dragY = 0.0;
  double _rotation = 0.0;
  double _scale = 1.0;
  bool _isDragging = false;
  bool _showTranslation = false;
  double _initialTouchX = 0.0;

  String _getPartOfSpeechLabel(String? pos) {
    if (pos == null) return '';

    final localizations = AppLocalizations.of(context)!;

    switch (pos.toLowerCase()) {
      case 'noun':
        return localizations.posNoun;
      case 'verb':
        return localizations.posVerb;
      case 'adjective':
        return localizations.posAdjective;
      case 'adverb':
        return localizations.posAdverb;
      case 'pronoun':
        return localizations.posPronoun;
      case 'preposition':
        return localizations.posPreposition;
      case 'conjunction':
        return localizations.posConjunction;
      case 'participle':
        return localizations.posParticiple;
      default:
        return pos;
    }
  }

  Widget _buildDefinitionCard(
    BuildContext context,
    Definition definition,
    ThemeData theme,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (definition.pos != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                _getPartOfSpeechLabel(definition.pos),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          if (definition.tr.isNotEmpty) ...[
            ...definition.tr.asMap().entries.map((entry) {
              final index = entry.key;
              final translation = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            translation.text,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (translation.mean != null &&
                      translation.mean!.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 8),
                      child: Text(
                        translation.mean!
                            .map((meaning) => meaning.text)
                            .join(', '),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ],

                  if (translation.ex != null && translation.ex!.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.examplesLabel,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...translation.ex!.map(
                            (example) => Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    example.text,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurface,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  if (example.tr != null &&
                                      example.tr!.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    ...example.tr!.map(
                                      (exampleTranslation) => Text(
                                        '→ ${exampleTranslation.text}',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withValues(alpha: 0.7),
                                            ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  if (index < definition.tr.length - 1)
                    const SizedBox(height: 8),
                ],
              );
            }),
          ],
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _swipeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _resetController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dictContext = context.read<DictionaryContext>();
      final savedWords = dictContext.savedWords;
      final keys = savedWords.keys.toList();
      if (keys.isEmpty) return;
      final srs = GetIt.I.get<SrsService>();
      final due = srs.getDueWords(keys);
      setState(() {
        _sessionWords = due;
        _currentWordIndex = 0;
      });
    });
  }

  @override
  void dispose() {
    _swipeController.dispose();
    _resetController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
      _initialTouchX = details.localPosition.dx;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    // Разрешаем перетаскивание только когда показан перевод
    if (_showTranslation) {
      setState(() {
        final currentTouchX = details.localPosition.dx;
        final touchDeltaX = currentTouchX - _initialTouchX;

        _dragX = touchDeltaX;
        _dragY = 0.0;
        // Поворот на основе горизонтального сдвига (макс. ~15°)
        _rotation = (_dragX / 300) * 0.26; // 0.26 радиан ≈ 15°
        _scale = 1.0 - (_dragX.abs() / 1000).clamp(0.0, 0.1);
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    final threshold = 100.0;
    final velocity = details.velocity.pixelsPerSecond.dx;

    setState(() {
      _isDragging = false;
    });

    // Завершение свайпа разрешено только при показанном переводе
    if (!_showTranslation) {
      _resetCard();
      return;
    }

    if (_dragX.abs() > threshold || velocity.abs() > 500) {
      if (_dragX > 0 || velocity > 0) {
        _animateSwipeRight();
      } else {
        _animateSwipeLeft();
      }
    } else {
      _resetCard();
    }
  }

  void _animateSwipeRight() {
    _swipeController.forward().then((_) {
      _handleKnow();
      _resetCard();
      _swipeController.reset();
    });
  }

  void _animateSwipeLeft() {
    _swipeController.forward().then((_) {
      _handleDontKnow();
      _resetCard();
      _swipeController.reset();
    });
  }

  void _resetCard() {
    _resetController.forward().then((_) {
      setState(() {
        _dragX = 0.0;
        _dragY = 0.0;
        _rotation = 0.0;
        _scale = 1.0;
      });
      _resetController.reset();
    });
  }

  void _toggleTranslation() {
    setState(() {
      if (!_showTranslation) {
        _showTranslation = true;
      }
    });
  }

  void _handleKnow() {
    _applyRatingAndNext(SrsRating.good);
  }

  void _handleDontKnow() {
    _applyRatingAndNext(SrsRating.again);
  }

  void _applyRatingAndNext(SrsRating rating) {
    if (_sessionWords.isEmpty) {
      _nextWord();
      return;
    }
    final srs = GetIt.I.get<SrsService>();
    final word = _sessionWords[_currentWordIndex];
    srs.updateWithRating(word, rating);

    final dictContext = context.read<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final keys = savedWords.keys.toList();
    final updatedDue = srs.getDueWords(keys);
    setState(() {
      _sessionWords = updatedDue;
      if (_sessionWords.isEmpty) {
        _currentWordIndex = 0;
      } else {
        _currentWordIndex = _currentWordIndex.clamp(
          0,
          _sessionWords.length - 1,
        );
      }
    });
    _nextWord();
  }

  void _nextWord() {
    setState(() {
      _showTranslation = false;
      final words = _sessionWords;
      if (words.isEmpty) {
        _currentWordIndex = 0;
        return;
      }
      if (_currentWordIndex < words.length - 1) {
        _currentWordIndex++;
      } else {
        _currentWordIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dictContext = context.watch<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final theme = Theme.of(context);

    if (_sessionWords.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.learning)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 80,
                  color: theme.colorScheme.primary.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.noWordsToLearn,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (savedWords.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.learning)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school_outlined,
                  size: 80,
                  color: theme.colorScheme.primary.withValues(alpha: 0.5),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.noWordsToLearn,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    final words = _sessionWords;
    final safeIndex = _currentWordIndex.clamp(
      0,
      words.isNotEmpty ? words.length - 1 : 0,
    );
    final currentWord = words.isNotEmpty ? words[safeIndex] : '';
    final currentDefinitions = currentWord.isNotEmpty
        ? (savedWords[currentWord] ?? [])
        : [];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.learning), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Text(
                      l10n.wordProgress(
                        words.isEmpty ? 0 : _currentWordIndex + 1,
                        words.length,
                      ),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: words.isEmpty
                          ? 0
                          : (_currentWordIndex + 1) / words.length,
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              Expanded(
                child: Center(
                  child: GestureDetector(
                    onPanStart: _onPanStart,
                    onPanUpdate: _onPanUpdate,
                    onPanEnd: _onPanEnd,
                    child: AnimatedBuilder(
                      animation: Listenable.merge([
                        _swipeController,
                        _resetController,
                      ]),
                      builder: (context, child) {
                        double finalX = _dragX;
                        double finalY = _dragY;
                        double finalRotation = _rotation;
                        double finalScale = _scale;

                        // Применяем анимацию свайпа при уходе карточки
                        if (_swipeController.isAnimating) {
                          final swipeProgress = _swipeController.value;
                          final swipeDirection = _dragX > 0 ? 1.0 : -1.0;
                          finalX =
                              _dragX + (swipeDirection * 400 * swipeProgress);
                          finalY = _dragY + (200 * swipeProgress);
                          finalRotation =
                              _rotation +
                              (swipeDirection * 0.5 * swipeProgress);
                          finalScale = _scale - (0.3 * swipeProgress);
                        }

                        // Применяем анимацию возврата при сбросе
                        if (_resetController.isAnimating) {
                          final resetProgress = _resetController.value;
                          finalX = _dragX * (1 - resetProgress);
                          finalY = _dragY * (1 - resetProgress);
                          finalRotation = _rotation * (1 - resetProgress);
                          finalScale =
                              _scale + ((1.0 - _scale) * resetProgress);
                        }

                        return Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..translateByDouble(finalX, finalY, 1.0, 1.0)
                            ..rotateZ(finalRotation)
                            ..scaleByDouble(finalScale, finalScale, 1.0, 1.0),
                          child: Stack(
                            children: [
                              if (!_isDragging && _dragX.abs() < 50) ...[
                                Positioned(
                                  top: 10,
                                  left: 5,
                                  right: 5,
                                  child: Transform.scale(
                                    scale: 0.95,
                                    child: Opacity(
                                      opacity: 0.3,
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          height: 400,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: theme
                                                .colorScheme
                                                .surfaceContainerHigh,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],

                              GestureDetector(
                                onTap: _toggleTranslation,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: _isDragging && _dragX.abs() > 50
                                        ? [
                                            BoxShadow(
                                              color: _dragX > 0
                                                  ? Colors.green.withValues(
                                                      alpha: 0.6,
                                                    )
                                                  : Colors.red.withValues(
                                                      alpha: 0.6,
                                                    ),
                                              blurRadius: 20,
                                              spreadRadius: 5,
                                            ),
                                          ]
                                        : null,
                                  ),
                                  child: Card(
                                    elevation: _isDragging ? 12 : 8,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color:
                                            theme.colorScheme.surfaceContainer,
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: _showTranslation
                                                        ? 8
                                                        : 40,
                                                  ),

                                                  const SizedBox(height: 16),
                                                  Text(
                                                    currentWord,
                                                    style: theme
                                                        .textTheme
                                                        .headlineMedium
                                                        ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: theme
                                                              .colorScheme
                                                              .onSurface,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  if (currentDefinitions
                                                          .isNotEmpty &&
                                                      currentDefinitions
                                                              .first
                                                              .ts !=
                                                          null) ...[
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      '[${currentDefinitions.first.ts}]',
                                                      style: theme
                                                          .textTheme
                                                          .bodyLarge
                                                          ?.copyWith(
                                                            color: theme
                                                                .colorScheme
                                                                .onPrimaryContainer
                                                                .withValues(
                                                                  alpha: 0.8,
                                                                ),
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                    ),
                                                  ],

                                                  if (_showTranslation) ...[
                                                    const SizedBox(height: 24),
                                                    Divider(
                                                      color: theme
                                                          .colorScheme
                                                          .onPrimaryContainer
                                                          .withValues(
                                                            alpha: 0.3,
                                                          ),
                                                      thickness: 1,
                                                    ),
                                                    ...currentDefinitions.map(
                                                      (definition) =>
                                                          _buildDefinitionCard(
                                                            context,
                                                            definition,
                                                            theme,
                                                          ),
                                                    ),
                                                  ] else ...[
                                                    const SizedBox(height: 80),
                                                    Center(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 12,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color: theme
                                                              .colorScheme
                                                              .onPrimaryContainer
                                                              .withValues(
                                                                alpha: 0.1,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                25,
                                                              ),
                                                          border: Border.all(
                                                            color: theme
                                                                .colorScheme
                                                                .onPrimaryContainer
                                                                .withValues(
                                                                  alpha: 0.3,
                                                                ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          l10n.tapToTranslate,
                                                          style: theme
                                                              .textTheme
                                                              .bodyMedium
                                                              ?.copyWith(
                                                                color: theme
                                                                    .colorScheme
                                                                    .onPrimaryContainer
                                                                    .withValues(
                                                                      alpha:
                                                                          0.8,
                                                                    ),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],

                                                  const SizedBox(height: 60),
                                                ],
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            child: Text(
                                              _showTranslation
                                                  ? l10n.swipeInstructions
                                                  : l10n.tapToTranslate,
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                    color: theme
                                                        .colorScheme
                                                        .onPrimaryContainer
                                                        .withValues(alpha: 0.6),
                                                  ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    if (!_showTranslation) ...[
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _toggleTranslation,
                          icon: const Icon(Icons.translate),
                          label: Text(l10n.translate),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.surfaceContainer,
                            foregroundColor: theme.colorScheme.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _handleDontKnow,
                              icon: const Icon(Icons.refresh),
                              label: Text(l10n.dontKnow),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    theme.colorScheme.surfaceContainer,
                                foregroundColor: theme.colorScheme.error,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _handleKnow,
                              icon: const Icon(Icons.check),
                              label: Text(l10n.know),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    theme.colorScheme.surfaceContainer,
                                foregroundColor: theme.colorScheme.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
