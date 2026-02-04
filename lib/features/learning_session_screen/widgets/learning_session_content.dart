import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/provider/learning_session_notifier.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/word_card.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/word_progress_indicator.dart';
import 'package:nim2book_mobile_flutter/l10n/app_localizations.dart';

enum LearningMode { newOnly, reviewOnly, mixed }

class LearningSessionContent extends ConsumerStatefulWidget {
  final LearningMode mode;
  final Map<String, List<DictionaryCard>> savedCards;

  const LearningSessionContent({
    super.key,
    required this.mode,
    required this.savedCards,
  });

  @override
  ConsumerState<LearningSessionContent> createState() =>
      _LearningSessionContentState();
}

class _LearningSessionContentState
    extends ConsumerState<LearningSessionContent> {
  bool _pendingEmptyNotification = false;

  @override
  void initState() {
    super.initState();
    // Initialize session after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final notifier = ref.read(
          learningSessionNotifierProvider((
            mode: widget.mode,
            allSavedCards: widget.savedCards,
          )).notifier,
        );

        notifier.initializeSession();
      }
    });
  }

  void _toggleTranslation() {
    final notifier = ref.read(
      learningSessionNotifierProvider((
        mode: widget.mode,
        allSavedCards: widget.savedCards,
      )).notifier,
    );
    notifier.toggleTranslation();
  }

  void _handleKnow() {
    final notifier = ref.read(
      learningSessionNotifierProvider((
        mode: widget.mode,
        allSavedCards: widget.savedCards,
      )).notifier,
    );
    notifier.handleKnow();
  }

  void _handleDontKnow() {
    final notifier = ref.read(
      learningSessionNotifierProvider((
        mode: widget.mode,
        allSavedCards: widget.savedCards,
      )).notifier,
    );
    notifier.handleDontKnow();
  }

  @override
  Widget build(final BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final sessionState = ref.watch(
      learningSessionNotifierProvider((
        mode: widget.mode,
        allSavedCards: widget.savedCards,
      )),
    );

    // Listen for empty session changes
    ref.listen(
      learningSessionNotifierProvider((
        mode: widget.mode,
        allSavedCards: widget.savedCards,
      )),
      (previous, next) {
        if (next.sessionEmpty && !_pendingEmptyNotification) {
          _pendingEmptyNotification = true;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            final messenger = ScaffoldMessenger.of(context);
            messenger.clearSnackBars();
            switch (widget.mode) {
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
    );

    if (sessionState.sessionCards.isEmpty) {
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

    final cards = sessionState.sessionCards;
    final safeIndex = sessionState.currentWordIndex.clamp(
      0,
      cards.isNotEmpty ? cards.length - 1 : 0,
    );
    final currentCard = cards.isNotEmpty ? cards[safeIndex] : cards.first;

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
  }
}
