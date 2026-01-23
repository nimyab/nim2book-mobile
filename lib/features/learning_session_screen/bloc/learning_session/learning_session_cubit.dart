import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/features/srs/models/srs_item.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/bloc/learning_session/learning_session_state.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/learning_session_content.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';

class LearningSessionCubit extends Cubit<LearningSessionState> {
  final LearningMode mode;
  final Map<String, List<DictionaryWord>> allSavedWords;
  final SrsService _srsService = GetIt.I.get<SrsService>();

  LearningSessionCubit({required this.mode, required this.allSavedWords})
    : super(const LearningSessionState(sessionWords: [], currentWordIndex: 0));

  void initializeSession() {
    final now = DateTime.now();
    final allIdentifiers = _srsService.getIdentifiersFromSavedWords(
      allSavedWords,
    );
    List<String> identifiers;
    var isEmpty = false;

    switch (mode) {
      case LearningMode.mixed:
        identifiers = _srsService.getDueWords(allIdentifiers);
        isEmpty = identifiers.isEmpty;
        break;
      case LearningMode.reviewOnly:
        final reviewDue = <String>[];
        for (final identifier in allIdentifiers) {
          final item = _srsService.getOrCreateItem(identifier);
          if (!item.nextReviewAt.isAfter(now) && item.lastReviewedAt != null) {
            reviewDue.add(identifier);
          }
        }
        identifiers = reviewDue;
        isEmpty = identifiers.isEmpty;
        break;
      case LearningMode.newOnly:
        final newDue = <String>[];
        for (final identifier in allIdentifiers) {
          final item = _srsService.getOrCreateItem(identifier);
          if (!item.nextReviewAt.isAfter(now) && item.lastReviewedAt == null) {
            newDue.add(identifier);
          }
        }
        final used = _srsService.getDailyNewCount(now: now);
        final limit = _srsService.getDailyNewLimit();
        final slots = (limit - used).clamp(0, limit);
        identifiers = slots > 0 ? newDue.take(slots).toList() : <String>[];
        isEmpty = identifiers.isEmpty;
        break;
    }

    emit(
      state.copyWith(
        sessionWords: identifiers,
        currentWordIndex: 0,
        sessionEmpty: isEmpty,
        totalWordsStudied: 0,
        initialSessionSize: identifiers.length,
      ),
    );
  }

  void toggleTranslation() {
    if (!state.showTranslation) {
      emit(state.copyWith(showTranslation: true));
    }
  }

  void handleKnow() {
    _applyRatingAndNext(SrsRating.good);
  }

  void handleDontKnow() {
    _applyRatingAndNext(SrsRating.again);
  }

  void _applyRatingAndNext(final SrsRating rating) {
    if (state.sessionWords.isEmpty) {
      _completeSession();
      return;
    }

    final identifier = state.sessionWords[state.currentWordIndex];
    _srsService.updateWithRating(identifier, rating);

    final updatedWords = List<String>.from(state.sessionWords);

    if (rating == SrsRating.good) {
      // Элемент выучен - удаляем из сессии
      updatedWords.removeAt(state.currentWordIndex);

      final newTotalStudied = state.totalWordsStudied + 1;

      emit(
        state.copyWith(
          totalWordsStudied: newTotalStudied,
          sessionWords: updatedWords,
        ),
      );
    } else {
      // Элемент не выучен - перемещаем в конец списка
      final currentIdentifier = updatedWords.removeAt(state.currentWordIndex);
      updatedWords.add(currentIdentifier);

      emit(state.copyWith(sessionWords: updatedWords));
    }

    _nextWord();
  }

  void _nextWord() {
    final words = state.sessionWords;

    // Проверяем, завершена ли сессия
    if (words.isEmpty || state.totalWordsStudied >= state.initialSessionSize) {
      _completeSession();
      return;
    }

    // Убеждаемся, что индекс валиден
    final safeIndex = state.currentWordIndex >= words.length
        ? 0
        : state.currentWordIndex;

    emit(state.copyWith(showTranslation: false, currentWordIndex: safeIndex));
  }

  void _completeSession() {
    emit(
      state.copyWith(
        showTranslation: false,
        currentWordIndex: 0,
        sessionEmpty: true,
      ),
    );
  }
}
