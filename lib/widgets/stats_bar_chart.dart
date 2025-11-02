import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class StatsBarChart extends StatelessWidget {
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

  const StatsBarChart({
    super.key,
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
      if (buckets.length >= 90) return 10;
      if (buckets.length >= 30) return 5;
      if (buckets.length > 12) return (buckets.length / 12).ceil();
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
                          if (!isZero && !isMax) return const SizedBox.shrink();
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
