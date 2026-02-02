import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ReviewDueHeader extends StatelessWidget {
  final Map<String, List<DictionaryCard>> savedCards;

  const ReviewDueHeader({super.key, required this.savedCards});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final dictionarySerivice = GetIt.I.get<DictionaryService>();
    final count = dictionarySerivice.getDueCardsCount();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(Icons.schedule, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            l10n.reviewDueToday(count),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
