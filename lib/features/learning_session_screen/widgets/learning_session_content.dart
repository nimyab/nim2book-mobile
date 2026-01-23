import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_cubit.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/bloc/learning_session/learning_session_cubit.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/bloc/learning_session/learning_session_state.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/word_card.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/word_progress_indicator.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

enum LearningMode { newOnly, reviewOnly, mixed }

class LearningSessionContent extends StatefulWidget {
  const LearningSessionContent({super.key});

  @override
  State<LearningSessionContent> createState() => _LearningSessionContentState();
}

class _LearningSessionContentState extends State<LearningSessionContent> {
  bool _pendingEmptyNotification = false;

  void _toggleTranslation() {
    context.read<LearningSessionCubit>().toggleTranslation();
  }

  void _handleKnow() {
    context.read<LearningSessionCubit>().handleKnow();
  }

  void _handleDontKnow() {
    context.read<LearningSessionCubit>().handleDontKnow();
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return BlocConsumer<LearningSessionCubit, LearningSessionState>(
      listener: (final context, final state) {
        if (state.sessionEmpty && !_pendingEmptyNotification) {
          _pendingEmptyNotification = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final messenger = ScaffoldMessenger.of(context);
            messenger.clearSnackBars();
            final cubit = context.read<LearningSessionCubit>();
            switch (cubit.mode) {
              case LearningMode.newOnly:
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.noNewWordsToday)),
                );
                break;
              case LearningMode.reviewOnly:
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.noReviewWordsDue)),
                );
                break;
              case LearningMode.mixed:
                messenger.showSnackBar(
                  SnackBar(content: Text(l10n.noMixedSessionAvailable)),
                );
                break;
            }
            setState(() {
              _pendingEmptyNotification = false;
            });
          });
        }
      },
      builder: (final context, final sessionState) {
        final savedWords = context.select(
          (final DictionaryCubit c) => c.state.savedWords,
        );

        if (sessionState.sessionWords.isEmpty) {
          final cubit = context.read<LearningSessionCubit>();
          return Center(
            child: Text(
              switch (cubit.mode) {
                LearningMode.newOnly => l10n.noNewWordsToday,
                LearningMode.reviewOnly => l10n.noReviewWordsDue,
                LearningMode.mixed => l10n.noMixedSessionAvailable,
              },
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }

        final identifiers = sessionState.sessionWords;
        final safeIndex = sessionState.currentWordIndex.clamp(
          0,
          identifiers.isNotEmpty ? identifiers.length - 1 : 0,
        );
        final currentIdentifier = identifiers.isNotEmpty
            ? identifiers[safeIndex]
            : '';

        // Извлекаем слово и находим конкретный DictionaryWord по идентификатору
        final srsService = GetIt.I.get<SrsService>();
        final currentWord = currentIdentifier.isNotEmpty
            ? srsService.extractWord(currentIdentifier)
            : '';
        final currentDictionaryWord = currentIdentifier.isNotEmpty
            ? srsService.findWordByIdentifier(currentIdentifier, savedWords)
            : null;
        final currentDefinitions = currentDictionaryWord != null
            ? [currentDictionaryWord]
            : <DictionaryWord>[];

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                WordProgressIndicator(word: currentIdentifier),
                const SizedBox(height: 16),
                Expanded(
                  child: Center(
                    child: WordCard(
                      key: ValueKey(
                        '$currentIdentifier-${sessionState.currentWordIndex}',
                      ),
                      word: currentWord,
                      definitions: currentDefinitions,
                      showTranslation: sessionState.showTranslation,
                      onToggleTranslation: _toggleTranslation,
                      onKnow: _handleKnow,
                      onDontKnow: _handleDontKnow,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _handleDontKnow,
                          icon: const Icon(Icons.refresh),
                          label: Text(l10n.dontKnow),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.surfaceContainer,
                            foregroundColor: theme.colorScheme.error,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _handleKnow,
                          icon: const Icon(Icons.check),
                          label: Text(l10n.know),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.surfaceContainer,
                            foregroundColor: theme.colorScheme.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
