import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' as intl;
import 'package:nim2book_mobile_flutter/core/contexts/dictionary_context.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/core/srs/srs_item.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

enum StatsPeriod { last7, last30, last90, thisYear, allTime }

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  static const bool kEnableMockTwoYears = false;
  StatsPeriod _period = kEnableMockTwoYears
      ? StatsPeriod.allTime
      : StatsPeriod.last7;
  final bool _useMockTwoYears = kEnableMockTwoYears;

  List<SrsItem> _generateMockItemsTwoYears() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final rng = math.Random(42);
    final items = <SrsItem>[];
    int wordId = 0;

    for (int d = 0; d < 730; d++) {
      final date = today.subtract(Duration(days: d));
      final weekday = date.weekday;
      final baseRepeat = (weekday <= 5) ? 9 : 5;
      final seasonBoost = (date.month == 1 || date.month == 9) ? 3 : 0;
      final repeatedCount = baseRepeat + seasonBoost + rng.nextInt(4);
      final learnedCount = rng.nextInt(3) == 0 ? 1 : 0;
      final knownCount = rng.nextInt(4) == 0 ? (1 + rng.nextInt(2)) : 0;

      for (int i = 0; i < repeatedCount; i++) {
        items.add(
          SrsItem(
            word: 'mock_${wordId++}',
            repetition: 1 + rng.nextInt(4),
            intervalDays: 1 + rng.nextInt(20),
            easiness: 2.0 + rng.nextDouble(),
            lastReviewedAt: date,
            nextReviewAt: date.add(Duration(days: rng.nextInt(30))),
          ),
        );
      }
      for (int i = 0; i < learnedCount; i++) {
        items.add(
          SrsItem(
            word: 'mock_${wordId++}',
            repetition: 3 + rng.nextInt(2),
            intervalDays: 1 + rng.nextInt(20),
            easiness: 2.2 + rng.nextDouble(),
            lastReviewedAt: date,
            nextReviewAt: date.add(Duration(days: rng.nextInt(30))),
          ),
        );
      }
      for (int i = 0; i < knownCount; i++) {
        items.add(
          SrsItem(
            word: 'mock_${wordId++}',
            repetition: 8 + rng.nextInt(3),
            intervalDays: 10 + rng.nextInt(90),
            easiness: 2.5 + rng.nextDouble(),
            lastReviewedAt: date,
            nextReviewAt: date.add(Duration(days: rng.nextInt(120))),
          ),
        );
      }
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dict = context.watch<DictionaryContext>();
    final words = dict.savedWords.keys.toList();
    final theme = Theme.of(context);
    final srs = GetIt.I.get<SrsService>();

    final items = _useMockTwoYears
        ? _generateMockItemsTwoYears()
        : words.map((w) => srs.getOrCreateItem(w)).toList();
    final now = DateTime.now();
    final streak = srs.getStudyStreakDays(now: now);
    final record = srs.getStudyStreakRecord();
    final usedToday = srs.getDailyNewCount(now: now);
    final dailyLimit = srs.getDailyNewLimit();

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
      appBar: AppBar(title: Text(l10n.statistics), centerTitle: true),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
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
                            l10n.studyStreakDays(streak),
                            style: theme.textTheme.titleMedium,
                          ),
                          Text(
                            l10n.periodStatsHeader, // subtle caption
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
                            l10n.recordStreakDays(record),
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

  // Removed unused _isSameDay helper

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

    final maxLearned = learned.isEmpty ? 0 : learned.reduce(math.max);
    final maxRepeated = repeated.isEmpty ? 0 : repeated.reduce(math.max);
    final maxKnown = known.isEmpty ? 0 : known.reduce(math.max);
    final globalMax = math.max(maxLearned, math.max(maxRepeated, maxKnown));
    final chartMaxY = (globalMax == 0 ? 1 : globalMax).toDouble();

    double textWidth(String t) {
      final tp = TextPainter(
        text: TextSpan(text: t, style: labelTextStyle),
        textDirection: ui.TextDirection.ltr,
      )..layout();
      return tp.width;
    }

    final label0 = '0';
    final labelMid = '${(globalMax / 2).round()}';
    final labelMax = '${globalMax.round()}';
    final maxLabelWidth = math.max(
      textWidth(label0),
      math.max(textWidth(labelMid), textWidth(labelMax)),
    );

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
        SizedBox(height: 20),
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
                          // Use full opacity to improve visibility of the "Known" series.
                          color: knownColor.withValues(alpha: 1.0),
                          width: dynamicBarWidth,
                        ),
                      ],
                    );
                  }),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: (globalMax == 0
                        ? 1
                        : (globalMax / 4).ceilToDouble()),
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
                        interval: chartMaxY, // only 0 and max
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
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
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
