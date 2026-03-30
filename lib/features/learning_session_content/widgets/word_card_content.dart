import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_content/widgets/definition_card.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/utils/part_of_speech_localizer.dart';

class WordCardContent extends ConsumerWidget {
  final DictionaryCard card;
  final bool showTranslation;
  final bool showTranslationOnFront;

  const WordCardContent({
    super.key,
    required this.card,
    required this.showTranslation,
    required this.showTranslationOnFront,
  });

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final frontText =
        showTranslationOnFront && card.wordData.translations.isNotEmpty
        ? card.wordData.translations.first
        : card.wordData.text;
    final showSourceSide = showTranslation && showTranslationOnFront;
    final showTranslationSide = showTranslation && !showTranslationOnFront;
    final partOfSpeechLabel = PartOfSpeechLocalizer.getLabel(
      l10n,
      card.wordData.partOfSpeech,
    );

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: showTranslation ? 8 : 40),
                const SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 56),
                      child: Text(
                        frontText,
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      child: Tooltip(
                        message: l10n.pronounce,
                        child: IconButton(
                          icon: Icon(
                            Icons.volume_up,
                            color: theme.colorScheme.primary,
                          ),
                          onPressed: () {
                            ref.read(ttsServiceProvider).speak(frontText);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    partOfSpeechLabel,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (!showTranslationOnFront &&
                    card.wordData.transcription != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    '[${card.wordData.transcription}]',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer.withValues(
                        alpha: 0.8,
                      ),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                if (showTranslationSide) ...[
                  const SizedBox(height: 24),
                  Divider(
                    color: theme.colorScheme.onPrimaryContainer.withValues(
                      alpha: 0.3,
                    ),
                    thickness: 1,
                  ),
                  DefinitionCard(word: card.wordData),
                ] else if (showSourceSide) ...[
                  const SizedBox(height: 24),
                  Divider(
                    color: theme.colorScheme.onPrimaryContainer.withValues(
                      alpha: 0.3,
                    ),
                    thickness: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          card.wordData.text,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        if (card.wordData.transcription != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            '[${card.wordData.transcription}]',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: theme.colorScheme.onPrimaryContainer
                                  .withValues(alpha: 0.8),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                        if (card.wordData.examples.isNotEmpty) ...[
                          const SizedBox(height: 12),
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
                          ...card.wordData.examples.map(
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
                                  if (example.translatedText.isNotEmpty) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      '→ ${example.translatedText}',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme.colorScheme.onSurface
                                                .withValues(alpha: 0.7),
                                          ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
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
