import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/contexts/dictionary_context.dart';
import '../../core/models/dictionary/dictionary.dart';
import '../../core/services/srs_service.dart';
import '../../core/srs/srs_item.dart';

// Периоды для статистики (локально в этом файле, чтобы не зависеть от StatsScreen)
enum StatsPeriod { last7, last30, last90, thisYear, allTime }

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
  StatsPeriod _period = StatsPeriod.last7;
  // Значения анимации для эффектов наподобие Tinder
  double _dragX = 0.0;
  double _dragY = 0.0;
  double _rotation = 0.0;
  double _scale = 1.0;
  bool _isDragging = false;
  bool _showTranslation = false;
  double _initialTouchX = 0.0;
  VoidCallback? _srsDailyNewListener;

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
    // Не запускаем сессию обучения при открытии экрана;
    // сессия начнётся только после выбора режима пользователем.

    // Слушаем счётчик новых слов, чтобы кнопки режимов обновлялись
    final srs = GetIt.I.get<SrsService>();
    _srsDailyNewListener = () {
      if (!mounted) return;
      setState(() {});
    };
    srs.dailyNewCountNotifier.addListener(_srsDailyNewListener!);
  }

  @override
  void dispose() {
    _swipeController.dispose();
    _resetController.dispose();
    final srs = GetIt.I.get<SrsService>();
    final listener = _srsDailyNewListener;
    if (listener != null) {
      srs.dailyNewCountNotifier.removeListener(listener);
    }
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

  // ----- Действия запуска сессий -----

  void _exitToDashboard() {
    setState(() {
      _sessionWords = [];
      _currentWordIndex = 0;
      _showTranslation = false;
    });
  }

  // ----- Вспомогательные методы статистики -----
  static bool _isInRange(DateTime d, DateTime start, DateTime endInclusive) {
    final ds = DateTime(d.year, d.month, d.day);
    final s = DateTime(start.year, start.month, start.day);
    final e = DateTime(endInclusive.year, endInclusive.month, endInclusive.day);
    return !ds.isBefore(s) && !ds.isAfter(e);
  }

  String _periodLabel(AppLocalizations l10n, StatsPeriod p) {
    switch (p) {
      case StatsPeriod.last7:
        return l10n.period7Days;
      case StatsPeriod.last30:
        return l10n.period30Days;
      case StatsPeriod.last90:
        return l10n.period90Days;
      case StatsPeriod.thisYear:
        return l10n.periodThisYear;
      case StatsPeriod.allTime:
        return l10n.periodAllTime;
    }
  }

  void _openPeriodPicker(BuildContext context, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.periodStatsHeader,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                DropdownButton<StatsPeriod>(
                  value: _period,
                  isExpanded: true,
                  items: StatsPeriod.values.map((p) {
                    return DropdownMenuItem(
                      value: p,
                      child: Text(_periodLabel(l10n, p)),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val == null) return;
                    setState(() => _period = val);
                    Navigator.of(ctx).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
      showDragHandle: true,
    );
  }

  _Range _computeRange(List<SrsItem> items, DateTime now, StatsPeriod period) {
    final today = DateTime(now.year, now.month, now.day);
    switch (period) {
      case StatsPeriod.last7:
        return _Range(today.subtract(const Duration(days: 6)), today, 1);
      case StatsPeriod.last30:
        return _Range(today.subtract(const Duration(days: 29)), today, 1);
      case StatsPeriod.last90:
        return _Range(today.subtract(const Duration(days: 89)), today, 1);
      case StatsPeriod.thisYear:
        final start = DateTime(today.year, 1, 1);
        final diff = today.difference(start).inDays + 1;
        return _Range(start, today, diff > 90 ? 7 : 1);
      case StatsPeriod.allTime:
        final reviewedDates = items
            .map((i) => i.lastReviewedAt)
            .whereType<DateTime>()
            .toList();
        if (reviewedDates.isEmpty) {
          return _Range(today.subtract(const Duration(days: 6)), today, 1);
        }
        reviewedDates.sort((a, b) => a.compareTo(b));
        final start = DateTime(
          reviewedDates.first.year,
          reviewedDates.first.month,
          reviewedDates.first.day,
        );
        final diff = today.difference(start).inDays + 1;
        return _Range(start, today, diff > 90 ? 7 : 1);
    }
  }

  List<DateTime> _buildBuckets(DateTime start, DateTime end, int bucketDays) {
    final buckets = <DateTime>[];
    var cursor = start;
    while (!cursor.isAfter(end)) {
      buckets.add(cursor);
      cursor = cursor.add(Duration(days: bucketDays));
    }
    return buckets;
  }

  List<int> _countByBucket(
    List<SrsItem> items,
    List<DateTime> buckets,
    int bucketDays,
  ) {
    final counts = List<int>.filled(buckets.length, 0);
    for (var i = 0; i < buckets.length; i++) {
      final start = buckets[i];
      final end = start.add(Duration(days: bucketDays - 1));
      final c = items.where((item) {
        final d = item.lastReviewedAt;
        if (d == null) return false;
        return _isInRange(d, start, end);
      }).length;
      counts[i] = c;
    }
    return counts;
  }

  List<int> _countLearnedByBucket(
    List<SrsItem> items,
    List<DateTime> buckets,
    int bucketDays,
  ) {
    final counts = List<int>.filled(buckets.length, 0);
    for (var i = 0; i < buckets.length; i++) {
      final start = buckets[i];
      final end = start.add(Duration(days: bucketDays - 1));
      final c = items.where((item) {
        final d = item.lastReviewedAt;
        if (d == null) return false;
        final ds = DateTime(d.year, d.month, d.day);
        final s = DateTime(start.year, start.month, start.day);
        final e = DateTime(end.year, end.month, end.day);
        return !ds.isBefore(s) && !ds.isAfter(e) && item.repetition >= 3;
      }).length;
      counts[i] = c;
    }
    return counts;
  }

  List<int> _countKnownByBucket(
    List<SrsItem> items,
    List<DateTime> buckets,
    int bucketDays,
  ) {
    final counts = List<int>.filled(buckets.length, 0);
    for (var i = 0; i < buckets.length; i++) {
      final start = buckets[i];
      final end = start.add(Duration(days: bucketDays - 1));
      final c = items.where((item) {
        final d = item.lastReviewedAt;
        if (d == null) return false;
        final ds = DateTime(d.year, d.month, d.day);
        final s = DateTime(start.year, start.month, start.day);
        final e = DateTime(end.year, end.month, end.day);
        return !ds.isBefore(s) && !ds.isAfter(e) && item.repetition >= 8;
      }).length;
      counts[i] = c;
    }
    return counts;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dictContext = context.watch<DictionaryContext>();
    final savedWords = dictContext.savedWords;
    final theme = Theme.of(context);

    if (_sessionWords.isEmpty) {
      final srs = GetIt.I.get<SrsService>();
      final now = DateTime.now();
      final items = savedWords.keys.map((w) => srs.getOrCreateItem(w)).toList();
      final usedToday = srs.getDailyNewCount(now: now);
      final dailyLimit = srs.getDailyNewLimit();
      final availableSlots = (dailyLimit - usedToday).clamp(0, dailyLimit);
      final reviewDueCount = items
          .where(
            (i) => i.lastReviewedAt != null && !i.nextReviewAt.isAfter(now),
          )
          .length;
      final newDueCount = items
          .where(
            (i) => i.lastReviewedAt == null && !i.nextReviewAt.isAfter(now),
          )
          .length;
      final newDueLimited = availableSlots > 0
          ? newDueCount.clamp(0, availableSlots)
          : 0;
      final mixedDueCount = srs.getDueWords(savedWords.keys.toList()).length;

      final hasNew = newDueLimited > 0;
      final hasReview = reviewDueCount > 0;
      final hasMixed = mixedDueCount > 0;

      final activeCount = items.where((i) => i.lastReviewedAt != null).length;
      final learnedTotal = items.where((i) => i.repetition >= 3).length;
      final repeatedTotal = items.where((i) => i.repetition >= 1).length;
      final knownTotal = items.where((i) => i.repetition >= 8).length;

      final periodRange = _computeRange(items, now, _period);
      final bucketDays = periodRange.bucketDays;
      final buckets = _buildBuckets(
        periodRange.start,
        periodRange.end,
        bucketDays,
      );
      final learnedByBucket = _countLearnedByBucket(items, buckets, bucketDays);
      final repeatedByBucket = _countByBucket(items, buckets, bucketDays);
      final knownByBucket = _countKnownByBucket(items, buckets, bucketDays);

      final periodFirstLearned = items.where((i) {
        final d = i.lastReviewedAt;
        if (d == null) return false;
        return _isInRange(d, periodRange.start, periodRange.end) &&
            i.repetition >= 3;
      }).length;
      final periodRepeated = items.where((i) {
        final d = i.lastReviewedAt;
        if (d == null) return false;
        return _isInRange(d, periodRange.start, periodRange.end);
      }).length;
      final periodKnown = items.where((i) {
        final d = i.lastReviewedAt;
        if (d == null) return false;
        return _isInRange(d, periodRange.start, periodRange.end) &&
            i.repetition >= 8;
      }).length;

      return Scaffold(
        appBar: AppBar(title: Text(l10n.learning), centerTitle: true),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Переход в словарь в виде карточки, как и другие кнопки
              Card(
                child: ListTile(
                  leading: const Icon(Icons.menu_book_outlined),
                  title: Text(l10n.dictionary),
                  onTap: () => context.push('/dictionary'),
                ),
              ),

              const SizedBox(height: 8),

              // Карточки режимов обучения
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.add_circle_outline,
                    color: hasNew
                        ? null
                        : theme.colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.38,
                          ),
                  ),
                  title: Text(l10n.learnNewWords),
                  subtitle: Text(
                    l10n.learnedTodayProgress(usedToday, dailyLimit),
                  ),
                  onTap: () {
                    if (!hasNew) {
                      final messenger = ScaffoldMessenger.of(context);
                      messenger.clearSnackBars();
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.noNewWordsToday)),
                      );
                      return;
                    }
                    context.push('/learning/new');
                  },
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.refresh_outlined,
                    color: hasReview
                        ? null
                        : theme.colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.38,
                          ),
                  ),
                  title: Text(l10n.reviewWords),
                  subtitle: Text(l10n.reviewDueToday(reviewDueCount)),
                  onTap: () {
                    if (!hasReview) {
                      final messenger = ScaffoldMessenger.of(context);
                      messenger.clearSnackBars();
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.noReviewWordsDue)),
                      );
                      return;
                    }
                    context.push('/learning/review');
                  },
                ),
              ),
              const SizedBox(height: 8),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.auto_awesome_motion_outlined,
                    color: hasMixed
                        ? null
                        : theme.colorScheme.onSurfaceVariant.withValues(
                            alpha: 0.38,
                          ),
                  ),
                  title: Text(l10n.mixedMode),
                  onTap: () {
                    if (!hasMixed) {
                      final messenger = ScaffoldMessenger.of(context);
                      messenger.clearSnackBars();
                      messenger.showSnackBar(
                        SnackBar(content: Text(l10n.noMixedSessionAvailable)),
                      );
                      return;
                    }
                    context.push('/learning/mixed');
                  },
                ),
              ),

              // Убраны кнопки "Пролистать слова" и "Автоматический режим"
              const SizedBox(height: 12),
              // Блок статистики
              Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              l10n.learnedTodayProgress(usedToday, dailyLimit),
                              style: theme.textTheme.titleMedium,
                            ),
                            Text(
                              l10n.periodStatsHeader,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              l10n.activeLearningCount(activeCount),
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _periodLabel(l10n, _period),
                            style: theme.textTheme.titleMedium,
                          ),
                          TextButton.icon(
                            onPressed: () => _openPeriodPicker(context, l10n),
                            icon: const Icon(Icons.filter_list),
                            label: Text(l10n.periodStatsHeader),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 260,
                        child: _StatsBarChart(
                          learned: learnedByBucket,
                          repeated: repeatedByBucket,
                          known: knownByBucket,
                          buckets: buckets,
                          learnedColor: theme.colorScheme.primary,
                          repeatedColor: theme.colorScheme.secondary,
                          knownColor: theme.colorScheme.tertiary,
                          legendLearnedLabel: l10n.chartLegendLearned,
                          legendRepeatedLabel: l10n.chartLegendRepeated,
                          legendKnownLabel: l10n.chartLegendKnown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 12,
                    children: [
                      Text(
                        l10n.periodStatsHeader,
                        style: theme.textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              l10n.totalLearnedWords(learnedTotal),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              l10n.totalRepeatedWords(repeatedTotal),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              l10n.totalKnownWords(knownTotal),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              l10n.periodFirstLearnedWords(periodFirstLearned),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              l10n.periodRepeatedWords(periodRepeated),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              l10n.periodBecameKnownWords(periodKnown),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
      appBar: AppBar(
        title: Text(l10n.learning),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: _exitToDashboard,
            icon: const Icon(Icons.dashboard_outlined),
            label: Text(l10n.menu),
          ),
        ],
      ),
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

class _Range {
  final DateTime start;
  final DateTime end;
  final int bucketDays;
  _Range(this.start, this.end, this.bucketDays);
}

class _StatsBarChart extends StatelessWidget {
  final List<int> learned;
  final List<int> repeated;
  final List<int> known;
  final List<DateTime> buckets;
  final Color learnedColor;
  final Color repeatedColor;
  final Color knownColor;
  final String legendLearnedLabel;
  final String legendRepeatedLabel;
  final String legendKnownLabel;

  const _StatsBarChart({
    required this.learned,
    required this.repeated,
    required this.known,
    required this.buckets,
    required this.learnedColor,
    required this.repeatedColor,
    required this.knownColor,
    required this.legendLearnedLabel,
    required this.legendRepeatedLabel,
    required this.legendKnownLabel,
  });

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = TextStyle(color: Colors.grey.shade600, fontSize: 10);

    int maxOf(List<int> list) => list.isEmpty
        ? 0
        : list.reduce((value, element) => value > element ? value : element);
    final maxLearned = maxOf(learned);
    final maxRepeated = maxOf(repeated);
    final maxKnown = maxOf(known);
    final globalMax = [
      maxLearned,
      maxRepeated,
      maxKnown,
    ].reduce((a, b) => a > b ? a : b);
    final chartMaxY = (globalMax == 0 ? 1 : globalMax).toDouble();

    double textWidth(String t) {
      final tp = TextPainter(
        text: TextSpan(text: t, style: labelTextStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      return tp.width;
    }

    final label0 = '0';
    final labelMid = '${(globalMax / 2).round()}';
    final labelMax = '${globalMax.round()}';
    final maxLabelWidth = [
      textWidth(label0),
      textWidth(labelMid),
      textWidth(labelMax),
    ].reduce((a, b) => a > b ? a : b);

    final leftReservedSize = maxLabelWidth + 8;

    Widget legendItem(Color c, String label) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 10, height: 10, color: c),
          const SizedBox(width: 4),
          Text(label, style: labelTextStyle),
        ],
      );
    }

    final localeCode = Localizations.localeOf(context).languageCode;
    final dateFmt = intl.DateFormat.MMMd(localeCode);
    final step = (() {
      if (buckets.length >= 90) {
        return 10;
      }
      if (buckets.length >= 30) {
        return 5;
      }
      if (buckets.length > 12) {
        return (buckets.length / 12).ceil();
      }
      return 1;
    })();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            legendItem(learnedColor, legendLearnedLabel),
            const SizedBox(width: 12),
            legendItem(repeatedColor, legendRepeatedLabel),
            const SizedBox(width: 12),
            legendItem(knownColor, legendKnownLabel),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              final int groupCount = buckets.length;
              final bool isVeryDense = groupCount >= 90;
              final bool isDense = !isVeryDense && groupCount >= 30;
              final double dynamicBarWidth = isVeryDense
                  ? 2.0
                  : (isDense ? 3.0 : 8.0);
              final double dynamicBarsSpace = isVeryDense
                  ? 1.0
                  : (isDense ? 1.0 : 2.0);
              final double dynamicGroupsSpace = isVeryDense
                  ? 1.0
                  : (isDense ? 2.0 : 8.0);

              return BarChart(
                BarChartData(
                  minY: 0,
                  maxY: chartMaxY,
                  groupsSpace: dynamicGroupsSpace,
                  barGroups: List.generate(buckets.length, (i) {
                    return BarChartGroupData(
                      x: i,
                      barsSpace: dynamicBarsSpace,
                      barRods: [
                        BarChartRodData(
                          toY: (i < learned.length ? learned[i] : 0).toDouble(),
                          color: learnedColor.withValues(alpha: 0.85),
                          width: dynamicBarWidth,
                        ),
                        BarChartRodData(
                          toY: (i < repeated.length ? repeated[i] : 0)
                              .toDouble(),
                          color: repeatedColor.withValues(alpha: 0.85),
                          width: dynamicBarWidth,
                        ),
                        BarChartRodData(
                          toY: (i < known.length ? known[i] : 0).toDouble(),
                          color: knownColor.withValues(alpha: 1.0),
                          width: dynamicBarWidth,
                        ),
                      ],
                    );
                  }),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: (chartMaxY == 0
                        ? 1
                        : (chartMaxY / 4).ceilToDouble()),
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
                    getDrawingVerticalLine: (value) =>
                        FlLine(color: Colors.grey.shade300, strokeWidth: 0.5),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade400, width: 1),
                      left: BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: leftReservedSize,
                        interval: chartMaxY, // только 0 и максимум
                        getTitlesWidget: (value, meta) {
                          final isZero = (value.abs() < 1e-6);
                          final isMax = ((chartMaxY - value).abs() < 1e-6);
                          if (!isZero && !isMax) {
                            return const SizedBox.shrink();
                          }
                          final t = value.round().toString();
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(t, style: labelTextStyle),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: step.toDouble(),
                        getTitlesWidget: (value, meta) {
                          final i = value.toInt();
                          if (i < 0 || i >= buckets.length) {
                            return const SizedBox.shrink();
                          }
                          if (i % step != 0) {
                            return const SizedBox.shrink();
                          }
                          final label = dateFmt.format(buckets[i]);
                          return Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(label, style: labelTextStyle),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
