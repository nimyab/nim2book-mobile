import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class EmptyDictionaryState extends StatelessWidget {
  const EmptyDictionaryState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Text(
        l10n.noSavedWords,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
