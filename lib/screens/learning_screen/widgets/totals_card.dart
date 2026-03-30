import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/themes/app_themes.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class TotalsCard extends StatelessWidget {
  final AppLocalizations l10n;
  final ThemeData theme;
  final ChartColors chartColors;
  final int learnedTotal;
  final int repeatedTotal;

  const TotalsCard({
    super.key,
    required this.l10n,
    required this.theme,
    required this.chartColors,
    required this.learnedTotal,
    required this.repeatedTotal,
  });

  @override
  Widget build(final BuildContext context) {
    return Card(
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
                      color: chartColors.learned,
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
                    color: chartColors.repeated,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
