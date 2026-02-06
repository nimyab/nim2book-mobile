import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsrs/fsrs.dart';
import 'package:nim2book_mobile_flutter/core/models/learning/learning_mode.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_provider.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/provider/learning_session_state.dart';

class LearningSessionNotifier extends Notifier<LearningSessionState> {
  LearningSessionNotifier(this.arg);

  final ({LearningMode mode}) arg;
  late final DictionaryNotifier _dictionaryNotifier;
  late final LearningMode mode;

  @override
  LearningSessionState build() {
    mode = arg.mode;
    _dictionaryNotifier = ref.watch(dictionaryNotifierProvider.notifier);
    final currentCard = _dictionaryNotifier.getDueCard(mode);
    return LearningSessionState(currentCard: currentCard);
  }

  void toggleTranslation() {
    if (!state.showTranslation) {
      state = state.copyWith(showTranslation: true);
    }
  }

  Future<void> handleKnow() async {
    if (state.currentCard == null) return;
    await _dictionaryNotifier.reviewCard(
      card: state.currentCard!,
      rating: Rating.good,
    );
    final newCard = _dictionaryNotifier.getDueCard(mode);
    state = state.copyWith(currentCard: newCard, showTranslation: false);
  }

  Future<void> handleDontKnow() async {
    if (state.currentCard == null) return;
    await _dictionaryNotifier.reviewCard(
      card: state.currentCard!,
      rating: Rating.again,
    );
    final newCard = _dictionaryNotifier.getDueCard(mode);
    state = state.copyWith(currentCard: newCard, showTranslation: false);
  }
}

final learningSessionNotifierProvider =
    NotifierProvider.family<
      LearningSessionNotifier,
      LearningSessionState,
      ({LearningMode mode})
    >(LearningSessionNotifier.new);
