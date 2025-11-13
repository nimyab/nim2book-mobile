import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/features/srs/logic/srs_stats_utils.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/widgets/stats_bar_chart.dart';

class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  StatsPeriod _period = StatsPeriod.last7;
  VoidCallback? _srsDailyNewListener;
  static const bool isMock = false;

  // Сессионные карточки убраны из этого экрана

  @override
  void initState() {
    super.initState();
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
    final srs = GetIt.I.get<SrsService>();
    final listener = _srsDailyNewListener;
    if (listener != null) {
      srs.dailyNewCountNotifier.removeListener(listener);
    }
    super.dispose();
  }

  String _periodLabel(final AppLocalizations l10n, final StatsPeriod p) {
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

  void _openPeriodPicker(
    final BuildContext context,
    final AppLocalizations l10n,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (final ctx) {
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
                  items: StatsPeriod.values
                      .where((final p) => p != StatsPeriod.allTime)
                      .map((final p) {
                        return DropdownMenuItem(
                          value: p,
                          child: Text(_periodLabel(l10n, p)),
                        );
                      })
                      .toList(),
                  onChanged: (final val) {
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

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final savedWords = context.select(
      (final DictionaryCubit c) => c.state.savedWords,
    );
    final theme = Theme.of(context);
    final srs = GetIt.I.get<SrsService>();
    final now = DateTime.now();
    final items = savedWords.keys
        .map((final w) => srs.getOrCreateItem(w))
        .toList();
    var usedToday = srs.getDailyNewCount(now: now);
    final dailyLimit = srs.getDailyNewLimit();
    final availableSlots = (dailyLimit - usedToday).clamp(0, dailyLimit);
    final reviewDueCount = items
        .where(
          (final i) => i.lastReviewedAt != null && !i.nextReviewAt.isAfter(now),
        )
        .length;
    final newDueCount = items
        .where(
          (final i) => i.lastReviewedAt == null && !i.nextReviewAt.isAfter(now),
        )
        .length;
    final newDueLimited = availableSlots > 0
        ? newDueCount.clamp(0, availableSlots)
        : 0;
    final mixedDueCount = srs.getDueWords(savedWords.keys.toList()).length;

    final hasNew = newDueLimited > 0;
    final hasReview = reviewDueCount > 0;
    final hasMixed = mixedDueCount > 0;

    var learnedTotal = items.where((final i) => i.repetition >= 3).length;
    var repeatedTotal = items.where((final i) => i.repetition >= 1).length;
    var knownTotal = items.where((final i) => i.repetition >= 8).length;

    final periodRange = computeRange(items, now, _period);
    final bucketDays = periodRange.bucketDays;
    var buckets = buildBuckets(periodRange.start, periodRange.end, bucketDays);
    var learnedByBucket = countLearnedByBucket(items, buckets, bucketDays);
    var repeatedByBucket = countByBucket(items, buckets, bucketDays);
    var knownByBucket = countKnownByBucket(items, buckets, bucketDays);

    var periodFirstLearned = items.where((final i) {
      final d = i.lastReviewedAt;
      if (d == null) return false;
      return isInRange(d, periodRange.start, periodRange.end) &&
          i.repetition >= 3;
    }).length;
    var periodRepeated = items.where((final i) {
      final d = i.lastReviewedAt;
      if (d == null) return false;
      return isInRange(d, periodRange.start, periodRange.end);
    }).length;
    var periodKnown = items.where((final i) {
      final d = i.lastReviewedAt;
      if (d == null) return false;
      return isInRange(d, periodRange.start, periodRange.end) &&
          i.repetition >= 8;
    }).length;

    if (isMock) {
      final today = DateTime(now.year, now.month, now.day);
      final mockStart = today.subtract(const Duration(days: 729));
      final rnd = math.Random(42);

      final mockDays = today.difference(mockStart).inDays + 1;
      final learnedDaily = List<int>.generate(mockDays, (final i) {
        const base = 3;
        const amp = 4;
        final seasonal = math.sin(i / 14.0) * amp;
        final noise = rnd.nextInt(3);
        final v = (base + seasonal + noise).round();
        return v < 0 ? 0 : v;
      });
      final repeatedDaily = List<int>.generate(mockDays, (final i) {
        return (learnedDaily[i] ~/ 2) + rnd.nextInt(2);
      });
      final knownDaily = List<int>.generate(mockDays, (final i) {
        return (learnedDaily[i] ~/ 3);
      });

      int idxOf(final DateTime d) {
        final ds = DateTime(d.year, d.month, d.day);
        return ds.difference(mockStart).inDays;
      }

      int sumRange(final DateTime s, final DateTime e, final List<int> src) {
        final si = idxOf(s);
        final ei = idxOf(e);
        var sum = 0;
        for (var i = si; i <= ei; i++) {
          if (i >= 0 && i < src.length) sum += src[i];
        }
        return sum;
      }

      final effectiveStart = periodRange.start.isBefore(mockStart)
          ? mockStart
          : periodRange.start;
      buckets = buildBuckets(effectiveStart, periodRange.end, bucketDays);

      learnedByBucket = List<int>.generate(buckets.length, (final i) {
        final s = buckets[i];
        final e = s.add(Duration(days: bucketDays - 1));
        return sumRange(s, e, learnedDaily);
      });
      repeatedByBucket = List<int>.generate(buckets.length, (final i) {
        final s = buckets[i];
        final e = s.add(Duration(days: bucketDays - 1));
        return sumRange(s, e, repeatedDaily);
      });
      knownByBucket = List<int>.generate(buckets.length, (final i) {
        final s = buckets[i];
        final e = s.add(Duration(days: bucketDays - 1));
        return sumRange(s, e, knownDaily);
      });

      // Дополнительно мокируем агрегаты для статистики
      final totalLearned = learnedDaily.fold<int>(
        0,
        (final a, final b) => a + b,
      );
      final totalRepeated = repeatedDaily.fold<int>(
        0,
        (final a, final b) => a + b,
      );
      final totalKnown = knownDaily.fold<int>(0, (final a, final b) => a + b);

      final periodLearnedSum = sumRange(
        effectiveStart,
        periodRange.end,
        learnedDaily,
      );
      final periodRepeatedSum = sumRange(
        effectiveStart,
        periodRange.end,
        repeatedDaily,
      );
      final periodKnownSum = sumRange(
        effectiveStart,
        periodRange.end,
        knownDaily,
      );

      learnedTotal = totalLearned;
      repeatedTotal = totalRepeated;
      knownTotal = totalKnown;

      usedToday = sumRange(today, today, learnedDaily);

      // Периодические значения для правой колонки статистики
      periodFirstLearned = periodLearnedSum;
      periodRepeated = periodRepeatedSum;
      periodKnown = periodKnownSum;
    }

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
                  context.push('/learning-session/new');
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
                  context.push('/learning-session/review');
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
                  context.push('/learning-session/mixed');
                },
              ),
            ),

            // Убраны кнопки "Пролистать слова" и "Автоматический режим"
            const SizedBox(height: 12),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${l10n.period}: ',
                          style: theme.textTheme.titleMedium,
                        ),
                        InkWell(
                          onTap: () => _openPeriodPicker(context, l10n),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 2.0,
                            ),
                            child: Text(
                              _periodLabel(l10n, _period),
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 260,
                      child: StatsBarChart(
                        learned: learnedByBucket,
                        repeated: repeatedByBucket,
                        known: knownByBucket,
                        buckets: buckets,
                        learnedColor: Theme.of(
                          context,
                        ).extension<ChartColors>()!.learned,
                        repeatedColor: Theme.of(
                          context,
                        ).extension<ChartColors>()!.repeated,
                        knownColor: Theme.of(
                          context,
                        ).extension<ChartColors>()!.known,
                        legendLearnedLabel: l10n.chartLegendLearned,
                        legendRepeatedLabel: l10n.chartLegendRepeated,
                        legendKnownLabel: l10n.chartLegendKnown,
                        noResultsLabel: l10n.noResults,
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
                child: Text(
                  l10n.learnedTodayProgress(usedToday, dailyLimit),
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ),

            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Opacity(
                          opacity: 0.0,
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).extension<ChartColors>()!.learned,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        SizedBox(
                          width: 64,
                          child: Text(
                            l10n.chartLegendTotal,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            _periodLabel(l10n, _period),
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            l10n.chartLegendLearned,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$learnedTotal',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$periodFirstLearned',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).extension<ChartColors>()!.repeated,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            l10n.chartLegendRepeated,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$repeatedTotal',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$periodRepeated',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).extension<ChartColors>()!.known,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            l10n.chartLegendKnown,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$knownTotal',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 64,
                          child: Text(
                            '$periodKnown',
                            textAlign: TextAlign.right,
                            style: theme.textTheme.bodyMedium?.copyWith(
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
}
