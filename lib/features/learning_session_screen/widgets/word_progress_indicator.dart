import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class WordProgressIndicator extends StatelessWidget {
  final String word;

  const WordProgressIndicator({super.key, required this.word});

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final srsService = GetIt.I.get<SrsService>();
    final item = srsService.getOrCreateItem(word);

    final isNew = item.lastReviewedAt == null;
    final repetition = item.repetition;
    const maxLevel = 8; // Show up to 8 levels

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isNew ? l10n.newWord : l10n.reviewWord,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                l10n.wordLevel(isNew ? 0 : repetition.clamp(0, maxLevel)),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(maxLevel, (final index) {
              final isActive = index < repetition;
              return Expanded(
                child: Container(
                  height: 6,
                  margin: EdgeInsets.only(right: index < maxLevel - 1 ? 4 : 0),
                  decoration: BoxDecoration(
                    color: isActive
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            }),
          ),
          if (!isNew) ...[
            const SizedBox(height: 8),
            Text(
              l10n.nextReviewDays(item.intervalDays),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.7,
                ),
                fontSize: 11,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
