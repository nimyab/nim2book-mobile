import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DueNowCard extends StatelessWidget {
  final AppLocalizations l10n;
  final ThemeData theme;
  final int newDueCount;
  final int reviewDueCount;

  const DueNowCard({
    super.key,
    required this.l10n,
    required this.theme,
    required this.newDueCount,
    required this.reviewDueCount,
  });

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DueNowRow(
              icon: Icons.add_circle_outline,
              label: l10n.learnNewWords,
              count: newDueCount,
              theme: theme,
              iconColor: theme.colorScheme.primary,
            ),
            const SizedBox(height: 8),
            _DueNowRow(
              icon: Icons.refresh_outlined,
              label: l10n.reviewWords,
              count: reviewDueCount,
              theme: theme,
              iconColor: theme.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}

class _DueNowRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final ThemeData theme;
  final Color iconColor;

  const _DueNowRow({
    required this.icon,
    required this.label,
    required this.count,
    required this.theme,
    required this.iconColor,
  });

  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium,
          ),
        ),
        SizedBox(
          width: 64,
          child: Text(
            '$count',
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
