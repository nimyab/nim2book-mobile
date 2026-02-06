import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/learning/learning_mode.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/word_card.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/word_progress_indicator.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/provider/learning_session_provider.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

class LearningSessionContent extends ConsumerStatefulWidget {
  final LearningMode mode;

  const LearningSessionContent({super.key, required this.mode});

  @override
  ConsumerState<LearningSessionContent> createState() =>
      _LearningSessionContentState();
}

class _LearningSessionContentState
    extends ConsumerState<LearningSessionContent> {
  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final sessionState = ref.watch(
      learningSessionNotifierProvider((mode: widget.mode)),
    );
    final sessionNotifier = ref.watch(
      learningSessionNotifierProvider((mode: widget.mode)).notifier,
    );

    if (sessionState.currentCard == null) {
      return Center(
        child: Text(
          switch (widget.mode) {
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

    final currentCard = sessionState.currentCard!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            WordProgressIndicator(card: currentCard),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: WordCard(
                  card: currentCard,
                  showTranslation: sessionState.showTranslation,
                  onToggleTranslation: () =>
                      sessionNotifier.toggleTranslation(),
                  onKnow: () => sessionNotifier.handleKnow(),
                  onDontKnow: () => sessionNotifier.handleDontKnow(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => sessionNotifier.handleDontKnow(),
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
                      onPressed: () => sessionNotifier.handleKnow(),
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
  }
}
