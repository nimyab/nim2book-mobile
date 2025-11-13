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
  final String? noResultsLabel;

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
    this.noResultsLabel,
  });

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final gridColor = theme.colorScheme.onSurfaceVariant.withValues(
      alpha: 0.28,
    );
    final axisColor = theme.colorScheme.onSurfaceVariant.withValues(
      alpha: 0.40,
    );
    final labelTextStyle = TextStyle(
      color: theme.colorScheme.onSurfaceVariant,
      fontSize: 10,
    );

    int maxOf(final List<int> list) => list.isEmpty
        ? 0
        : list.reduce(
            (final value, final element) => value > element ? value : element,
          );
    final maxLearned = maxOf(learned);
    final maxRepeated = maxOf(repeated);
    final maxKnown = maxOf(known);
    final globalMax = [
      maxLearned,
      maxRepeated,
      maxKnown,
    ].reduce((final a, final b) => a > b ? a : b);
    final chartMaxY = (globalMax == 0 ? 1 : globalMax).toDouble();
    final hasData = buckets.isNotEmpty && globalMax > 0;

    double textWidth(final String t) {
      final tp = TextPainter(
        text: TextSpan(text: t, style: labelTextStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      return tp.width;
    }

    const label0 = '0';
    final labelMid = '${(globalMax / 2).round()}';
    final labelMax = '${globalMax.round()}';
    final maxLabelWidth = [
      textWidth(label0),
      textWidth(labelMid),
      textWidth(labelMax),
    ].reduce((final a, final b) => a > b ? a : b);

    final leftReservedSize = maxLabelWidth + 8;

    final leftLabelInterval = chartMaxY == 0
        ? 1.0
        : (chartMaxY / 4).ceilToDouble();

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
        const SizedBox(height: 12),
        Expanded(
          child: hasData
              ? LayoutBuilder(
                  builder: (final ctx, final constraints) {
                    final groupCount = buckets.length;
                    final isVeryDense = groupCount >= 90;
                    final isDense = !isVeryDense && groupCount >= 30;
                    final dynamicLineWidth = isVeryDense
                        ? 1.2
                        : (isDense ? 1.6 : 2.2);

                    return LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: (buckets.isEmpty ? 0 : buckets.length - 1)
                            .toDouble(),
                        minY: 0,
                        maxY: chartMaxY,
                        gridData: FlGridData(
                          show: true,
                          horizontalInterval: (chartMaxY == 0
                              ? 1
                              : (chartMaxY / 4).ceilToDouble()),
                          getDrawingHorizontalLine: (final value) => FlLine(
                            color: gridColor,
                            strokeWidth: 0.8,
                            dashArray: const [4, 4],
                          ),
                          getDrawingVerticalLine: (final value) => FlLine(
                            color: gridColor,
                            strokeWidth: 0.8,
                            dashArray: const [4, 4],
                          ),
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(color: axisColor, width: 1),
                            left: BorderSide(color: axisColor, width: 1),
                            right: BorderSide(color: axisColor, width: 1),
                            top: BorderSide(color: axisColor, width: 1),
                          ),
                        ),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: leftReservedSize,
                              interval: leftLabelInterval,
                              getTitlesWidget: (final value, final meta) {
                                final isZero = (value.abs() < 1e-6);
                                final isMax =
                                    ((chartMaxY - value).abs() < 1e-6);
                                final ratio = value / leftLabelInterval;
                                final isMultiple =
                                    ((ratio.roundToDouble() - ratio).abs() <
                                    1e-6);
                                if (!isZero && !isMultiple && !isMax) {
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
                              getTitlesWidget: (final value, final meta) {
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
                        lineTouchData: const LineTouchData(enabled: false),
                        lineBarsData: [
                          LineChartBarData(
                            color: learnedColor,
                            isCurved: false,
                            barWidth: dynamicLineWidth,
                            dotData: const FlDotData(show: false),
                            spots: List.generate(buckets.length, (final i) {
                              final y = (i < learned.length ? learned[i] : 0)
                                  .toDouble();
                              return FlSpot(i.toDouble(), y);
                            }),
                          ),
                          LineChartBarData(
                            color: repeatedColor,
                            isCurved: false,
                            barWidth: dynamicLineWidth,
                            dotData: const FlDotData(show: false),
                            spots: List.generate(buckets.length, (final i) {
                              final y = (i < repeated.length ? repeated[i] : 0)
                                  .toDouble();
                              return FlSpot(i.toDouble(), y);
                            }),
                          ),
                          LineChartBarData(
                            color: knownColor,
                            isCurved: false,
                            barWidth: dynamicLineWidth,
                            dotData: const FlDotData(show: false),
                            spots: List.generate(buckets.length, (final i) {
                              final y = (i < known.length ? known[i] : 0)
                                  .toDouble();
                              return FlSpot(i.toDouble(), y);
                            }),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    noResultsLabel ?? '',
                    style: labelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
        ),
      ],
    );
  }
}
