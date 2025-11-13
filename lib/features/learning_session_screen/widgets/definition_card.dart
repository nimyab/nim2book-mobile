import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class DefinitionCard extends StatelessWidget {
  final Definition definition;

  const DefinitionCard({super.key, required this.definition});

  String _getPartOfSpeechLabel(final BuildContext context, final String? pos) {
    if (pos == null) return '';
    final localizations = AppLocalizations.of(context)!;
    switch (pos.toLowerCase()) {
      case 'noun':
        return localizations.posNoun;
      case 'verb':
        return localizations.posVerb;
      case 'adjective':
        return localizations.posAdjective;
      case 'adverb':
        return localizations.posAdverb;
      case 'pronoun':
        return localizations.posPronoun;
      case 'preposition':
        return localizations.posPreposition;
      case 'conjunction':
        return localizations.posConjunction;
      case 'participle':
        return localizations.posParticiple;
      default:
        return pos;
    }
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (definition.pos != null) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                _getPartOfSpeechLabel(context, definition.pos),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
          if (definition.tr.isNotEmpty) ...[
            ...definition.tr.asMap().entries.map((final entry) {
              final index = entry.key;
              final translation = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• ',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            translation.text,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (translation.mean != null &&
                      translation.mean!.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 8),
                      child: Text(
                        translation.mean!
                            .map((final meaning) => meaning.text)
                            .join(', '),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.8,
                          ),
                        ),
                      ),
                    ),
                  ],
                  if (translation.ex != null && translation.ex!.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.examplesLabel,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.7,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          ...translation.ex!.map(
                            (final example) => Container(
                              margin: const EdgeInsets.only(bottom: 6),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    example.text,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: theme.colorScheme.onSurface,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  if (example.tr != null &&
                                      example.tr!.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    ...example.tr!.map(
                                      (final exampleTranslation) => Text(
                                        '→ ${exampleTranslation.text}',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: theme.colorScheme.onSurface
                                                  .withValues(alpha: 0.7),
                                            ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (index < definition.tr.length - 1)
                    const SizedBox(height: 8),
                ],
              );
            }),
          ],
        ],
      ),
    );
  }
}
