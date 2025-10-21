import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/contexts/dictionary_context.dart';
import '../../core/models/dictionary/dictionary.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen>
    with TickerProviderStateMixin {
  int _currentWordIndex = 0;
  late AnimationController _swipeController;
  late AnimationController _resetController;

  // Animation values for Tinder-like effects
  double _dragX = 0.0;
  double _dragY = 0.0;
  double _rotation = 0.0;
  double _scale = 1.0;
  bool _isDragging = false;
  bool _showTranslation = false;
  
  // Track initial touch position for centered cursor behavior
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
          // Part of speech header
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

          // Translations
          if (definition.tr.isNotEmpty) ...[
            ...definition.tr.asMap().entries.map((entry) {
              final index = entry.key;
              final translation = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Translation text
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

                  // Meanings for this translation
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

                  // Examples for this translation
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
      // Store the initial touch position
      _initialTouchX = details.localPosition.dx;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    // Only allow drag updates if translation is shown
    if (_showTranslation) {
      setState(() {
        // Calculate current cursor position relative to initial touch
        final currentTouchX = details.localPosition.dx;
        final touchDeltaX = currentTouchX - _initialTouchX;
        
        // Set card position so cursor appears at center during horizontal movement
        _dragX = touchDeltaX;
        // Remove vertical movement - card only moves horizontally
        _dragY = 0.0;

        // Calculate rotation based on horizontal drag (max 15 degrees)
        _rotation = (_dragX / 300) * 0.26; // 0.26 radians ≈ 15 degrees

        // Calculate scale based on horizontal drag distance only
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

    // Only allow swipe completion if translation is shown
    if (!_showTranslation) {
      _resetCard();
      return;
    }

    // Determine swipe direction
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
    // Animate card flying off to the right
    _swipeController.forward().then((_) {
      _handleKnow();
      _resetCard();
      _swipeController.reset();
    });
  }

  void _animateSwipeLeft() {
    // Animate card flying off to the left
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
        // Don't reset translation state - preserve it when card returns to center
      });
      _resetController.reset();
    });
  }

  void _toggleTranslation() {
    setState(() {
      // Only allow showing translation, not hiding it once visible
      if (!_showTranslation) {
        _showTranslation = true;
      }
    });
  }

  void _handleKnow() {
    _nextWord();
  }

  void _handleDontKnow() {
    _nextWord();
  }

  void _nextWord() {
    final dictContext = context.read<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final words = savedWords.keys.toList();

    setState(() {
      _showTranslation = false; // Reset translation when moving to next word
      if (_currentWordIndex < words.length - 1) {
        _currentWordIndex++;
      } else {
        // Loop back to the beginning
        _currentWordIndex = 0;
      }
    });
  }

  void _previousWord() {
    final dictContext = context.read<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final words = savedWords.keys.toList();

    setState(() {
      _showTranslation =
          false; // Reset translation when moving to previous word
      if (_currentWordIndex > 0) {
        _currentWordIndex--;
      } else {
        // Loop to the end
        _currentWordIndex = words.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dictContext = context.watch<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final theme = Theme.of(context);

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

    final words = savedWords.keys.toList();
    final currentWord = words[_currentWordIndex];
    final currentDefinitions = savedWords[currentWord]!;
    final primaryTranslation =
        currentDefinitions.isNotEmpty && currentDefinitions.first.tr.isNotEmpty
        ? currentDefinitions.first.tr.first.text
        : l10n.noTranslationAvailable;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.learning), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Progress indicator
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Text(
                      l10n.wordProgress(_currentWordIndex + 1, words.length),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: (_currentWordIndex + 1) / words.length,
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

              // Flashcard
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
                        // Calculate final position including animation
                        double finalX = _dragX;
                        double finalY = _dragY;
                        double finalRotation = _rotation;
                        double finalScale = _scale;

                        // Apply swipe animation when swiping away
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

                        // Apply reset animation
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
                            ..translate(finalX, finalY)
                            ..rotateZ(finalRotation)
                            ..scale(finalScale),
                          child: Stack(
                            children: [
                              // Background card (next card preview)
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

                              // Main card
                              GestureDetector(
                                onTap: _toggleTranslation,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: _isDragging && _dragX.abs() > 50
                                        ? [
                                            BoxShadow(
                                              color: _dragX > 0
                                                  ? Colors.green.withValues(alpha: 0.6)
                                                  : Colors.red.withValues(alpha: 0.6),
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
                                        color: theme.colorScheme.surfaceContainer,
                                      ),
                                      child: Column(
                                      children: [
                                        // Main scrollable content
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                // Top padding for centering when content is short
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
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ],

                                                // Translation section (only show if _showTranslation is true)
                                                if (_showTranslation) ...[
                                                  const SizedBox(height: 24),
                                                  Divider(
                                                    color: theme
                                                        .colorScheme
                                                        .onPrimaryContainer
                                                        .withValues(alpha: 0.3),
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
                                                  // Show "Tap to translate" hint when translation is hidden
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
                                                                    alpha: 0.8,
                                                                  ),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],

                                                // Bottom padding to ensure content doesn't stick to bottom
                                                const SizedBox(height: 60),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Bottom section with instruction (fixed at bottom)
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
                              ), // Close inner GestureDetector
                            ),

                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ), // Close outer GestureDetector

              // Control buttons
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    // Translate button or Know/Don't Know buttons based on translation state
                    if (!_showTranslation) ...[
                      // Show only Translate button when translation is hidden
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
                      // Show Know/Don't Know buttons when translation is visible
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _handleDontKnow,
                              icon: const Icon(Icons.close),
                              label: Text(l10n.dontKnow),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.surfaceContainer,
                                foregroundColor: theme.colorScheme.error,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _handleKnow,
                              icon: const Icon(Icons.check),
                              label: Text(l10n.know),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: theme.colorScheme.surfaceContainer,
                                foregroundColor: theme.colorScheme.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
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
