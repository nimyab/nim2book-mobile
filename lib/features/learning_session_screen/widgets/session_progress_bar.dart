import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class SessionProgressBar extends StatelessWidget {
  final int currentIndex;
  final int totalWords;

  const SessionProgressBar({
    super.key,
    required this.currentIndex,
    required this.totalWords,
  });

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            l10n.wordProgress(
              totalWords == 0 ? 0 : currentIndex + 1,
              totalWords,
            ),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: totalWords == 0 ? 0 : (currentIndex + 1) / totalWords,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(
              theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
