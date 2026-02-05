import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsrs/fsrs.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/provider/learning_session_state.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/learning_session_content.dart';

class LearningSessionNotifier extends Notifier<LearningSessionState> {
  LearningSessionNotifier(this.arg);

  final ({LearningMode mode, Map<String, List<DictionaryCard>> allSavedCards})
  arg;
  late final DictionaryService _dictionaryService;
  late final LearningMode mode;
  late final Map<String, List<DictionaryCard>> allSavedCards;

  @override
  LearningSessionState build() {
    mode = arg.mode;
    allSavedCards = arg.allSavedCards;
    _dictionaryService = ref.read(dictionaryServiceProvider);
    return const LearningSessionState(sessionCards: [], currentWordIndex: 0);
  }

  void initializeSession() {
    var isEmpty = false;
    var sessionCards = <DictionaryCard>[];

    switch (mode) {
      case LearningMode.mixed:
        sessionCards = _dictionaryService.getDueCards();
        isEmpty = sessionCards.isEmpty;
        break;
      case LearningMode.reviewOnly:
        sessionCards = _dictionaryService
            .getDueCards()
            .where((card) => card.fsrsCard.step != 0)
            .toList();
        isEmpty = sessionCards.isEmpty;
        break;
      case LearningMode.newOnly:
        sessionCards = _dictionaryService
            .getDueCards()
            .where((card) => card.fsrsCard.step == 0)
            .toList();
        isEmpty = sessionCards.isEmpty;
        break;
    }

    state = state.copyWith(
      sessionCards: sessionCards,
      currentWordIndex: 0,
      sessionEmpty: isEmpty,
      totalWordsStudied: 0,
      initialSessionSize: sessionCards.length,
    );
  }

  void toggleTranslation() {
    if (!state.showTranslation) {
      state = state.copyWith(showTranslation: true);
    }
  }

  Future<void> handleKnow() async {
    await _applyRatingAndNext(Rating.good);
  }

  Future<void> handleDontKnow() async {
    await _applyRatingAndNext(Rating.again);
  }

  Future<void> _applyRatingAndNext(final Rating rating) async {
    if (state.sessionCards.isEmpty) {
      _completeSession();
      return;
    }

    final identifier = state.sessionCards[state.currentWordIndex];
    await _dictionaryService.reviewCard(card: identifier, rating: rating);

    final updatedCards = List<DictionaryCard>.from(state.sessionCards);

    if (rating == Rating.good) {
      // Элемент выучен - удаляем из сессии
      updatedCards.removeAt(state.currentWordIndex);

      final newTotalStudied = state.totalWordsStudied + 1;

      state = state.copyWith(
        totalWordsStudied: newTotalStudied,
        sessionCards: updatedCards,
      );
    } else {
      // Элемент не выучен - перемещаем в конец списка
      final currentIdentifier = updatedCards.removeAt(state.currentWordIndex);
      updatedCards.add(currentIdentifier);

      state = state.copyWith(sessionCards: updatedCards);
    }

    _nextWord();
  }

  void _nextWord() {
    final cards = state.sessionCards;

    // Проверяем, завершена ли сессия
    if (cards.isEmpty || state.totalWordsStudied >= state.initialSessionSize) {
      _completeSession();
      return;
    }

    // Убеждаемся, что индекс валиден
    final safeIndex = state.currentWordIndex >= cards.length
        ? 0
        : state.currentWordIndex;

    state = state.copyWith(showTranslation: false, currentWordIndex: safeIndex);
  }

  void _completeSession() {
    state = state.copyWith(
      showTranslation: false,
      currentWordIndex: 0,
      sessionEmpty: true,
    );
  }
}

final learningSessionNotifierProvider =
    NotifierProvider.family<
      LearningSessionNotifier,
      LearningSessionState,
      ({LearningMode mode, Map<String, List<DictionaryCard>> allSavedCards})
    >(LearningSessionNotifier.new);
