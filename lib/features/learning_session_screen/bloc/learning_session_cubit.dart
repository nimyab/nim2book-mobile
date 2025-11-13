import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/features/srs/models/srs_item.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/bloc/learning_session_state.dart';
import 'package:nim2book_mobile_flutter/features/learning_session_screen/widgets/learning_session_content.dart';

class LearningSessionCubit extends Cubit<LearningSessionState> {
  final LearningMode mode;
  final List<String> allSavedWords;
  final SrsService _srsService = GetIt.I.get<SrsService>();

  LearningSessionCubit({required this.mode, required this.allSavedWords})
    : super(const LearningSessionState(sessionWords: [], currentWordIndex: 0));

  void initializeSession() {
    final now = DateTime.now();
    List<String> words;
    var isEmpty = false;

    switch (mode) {
      case LearningMode.mixed:
        words = _srsService.getDueWords(allSavedWords);
        isEmpty = words.isEmpty;
        break;
      case LearningMode.reviewOnly:
        final reviewDue = <String>[];
        for (final w in allSavedWords) {
          final item = _srsService.getOrCreateItem(w);
          if (!item.nextReviewAt.isAfter(now) && item.lastReviewedAt != null) {
            reviewDue.add(w);
          }
        }
        words = reviewDue;
        isEmpty = words.isEmpty;
        break;
      case LearningMode.newOnly:
        final newDue = <String>[];
        for (final w in allSavedWords) {
          final item = _srsService.getOrCreateItem(w);
          if (!item.nextReviewAt.isAfter(now) && item.lastReviewedAt == null) {
            newDue.add(w);
          }
        }
        final used = _srsService.getDailyNewCount(now: now);
        final limit = _srsService.getDailyNewLimit();
        final slots = (limit - used).clamp(0, limit);
        words = slots > 0 ? newDue.take(slots).toList() : <String>[];
        isEmpty = words.isEmpty;
        break;
    }

    emit(
      state.copyWith(
        sessionWords: words,
        currentWordIndex: 0,
        sessionEmpty: isEmpty,
        totalWordsStudied: 0,
        initialSessionSize: words.length,
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
      _nextWord();
      return;
    }

    final word = state.sessionWords[state.currentWordIndex];
    _srsService.updateWithRating(word, rating);

    final newTotalStudied = state.totalWordsStudied + 1;

    // Get updated due words to remove words that are no longer due
    final updatedDue = _srsService.getDueWords(allSavedWords);

    emit(
      state.copyWith(
        totalWordsStudied: newTotalStudied,
        sessionWords: updatedDue,
      ),
    );

    _nextWord();
  }

  void _nextWord() {
    // Check if session is complete
    if (state.totalWordsStudied >= state.initialSessionSize) {
      emit(
        state.copyWith(
          showTranslation: false,
          currentWordIndex: 0,
          sessionEmpty: true,
        ),
      );
      return;
    }

    final words = state.sessionWords;
    if (words.isEmpty) {
      emit(
        state.copyWith(
          showTranslation: false,
          currentWordIndex: 0,
          sessionEmpty: true,
        ),
      );
      return;
    }

    // Ensure currentIndex is valid for the updated word list
    final safeIndex = state.currentWordIndex >= words.length
        ? 0
        : state.currentWordIndex;

    emit(state.copyWith(showTranslation: false, currentWordIndex: safeIndex));
  }
}
