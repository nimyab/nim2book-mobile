import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
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
                  items: StatsPeriod.values.map((final p) {
                    return DropdownMenuItem(
                      value: p,
                      child: Text(_periodLabel(l10n, p)),
                    );
                  }).toList(),
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
    final usedToday = srs.getDailyNewCount(now: now);
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

    final activeCount = items
        .where((final i) => i.lastReviewedAt != null)
        .length;
    final learnedTotal = items.where((final i) => i.repetition >= 3).length;
    final repeatedTotal = items.where((final i) => i.repetition >= 1).length;
    final knownTotal = items.where((final i) => i.repetition >= 8).length;

    final periodRange = computeRange(items, now, _period);
    final bucketDays = periodRange.bucketDays;
    final buckets = buildBuckets(
      periodRange.start,
      periodRange.end,
      bucketDays,
    );
    final learnedByBucket = countLearnedByBucket(items, buckets, bucketDays);
    final repeatedByBucket = countByBucket(items, buckets, bucketDays);
    final knownByBucket = countKnownByBucket(items, buckets, bucketDays);

    final periodFirstLearned = items.where((final i) {
      final d = i.lastReviewedAt;
      if (d == null) return false;
      return isInRange(d, periodRange.start, periodRange.end) &&
          i.repetition >= 3;
    }).length;
    final periodRepeated = items.where((final i) {
      final d = i.lastReviewedAt;
      if (d == null) return false;
      return isInRange(d, periodRange.start, periodRange.end);
    }).length;
    final periodKnown = items.where((final i) {
      final d = i.lastReviewedAt;
      if (d == null) return false;
      return isInRange(d, periodRange.start, periodRange.end) &&
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
                      child: StatsBarChart(
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
}
