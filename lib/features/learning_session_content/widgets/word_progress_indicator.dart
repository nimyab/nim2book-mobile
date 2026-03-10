import 'package:flutter/material.dart';
import 'package:fsrs/fsrs.dart' as fsrs;
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class WordProgressIndicator extends StatelessWidget {
  final DictionaryCard card;

  const WordProgressIndicator({super.key, required this.card});

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final state = card.fsrsCard.state;

    // Определяем текстовое представление состояния
    String getStateLabel() {
      switch (state) {
        case fsrs.State.learning:
          return l10n.newWord;
        case fsrs.State.review:
          return l10n.reviewWord;
        case fsrs.State.relearning:
          return l10n.reviewWord; // Используем reviewWord для состояния relearning
      }
    }

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
                l10n.learning, // Используем существующую локализацию
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                getStateLabel(),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
