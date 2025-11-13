import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/definition_card.dart';

class WordCardContent extends StatelessWidget {
  final String word;
  final List<Definition> definitions;
  final bool showTranslation;

  const WordCardContent({
    super.key,
    required this.word,
    required this.definitions,
    required this.showTranslation,
  });

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: showTranslation ? 8 : 40),
                const SizedBox(height: 16),
                Text(
                  word,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (definitions.isNotEmpty && definitions.first.ts != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    '[${definitions.first.ts}]',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(
                        alpha: 0.8,
                      ),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                if (showTranslation) ...[
                  const SizedBox(height: 24),
                  Divider(
                    color: theme.colorScheme.onPrimaryContainer.withValues(
                      alpha: 0.3,
                    ),
                    thickness: 1,
                  ),
                  ...definitions.map(
                    (final definition) =>
                        DefinitionCard(definition: definition),
                  ),
                ] else ...[
                  const SizedBox(height: 80),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.onPrimaryContainer.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: theme.colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.3),
                        ),
                      ),
                      child: Text(
                        l10n.tapToTranslate,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            showTranslation ? l10n.swipeInstructions : l10n.tapToTranslate,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.6,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
