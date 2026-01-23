import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';

import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class ReviewDueHeader extends StatelessWidget {
  final Map<String, List<DictionaryWord>> savedWords;

  const ReviewDueHeader({super.key, required this.savedWords});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final srs = GetIt.I.get<SrsService>();
    final identifiers = srs.getIdentifiersFromSavedWords(savedWords);
    final count = srs.getDueCount(identifiers);

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
