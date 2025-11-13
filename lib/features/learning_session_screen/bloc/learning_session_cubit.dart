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

  LearningSessionCubit({
    required this.mode,
    required this.allSavedWords,
  }) : super(
          const LearningSessionState(
            sessionWords: [],
            currentWordIndex: 0,
          ),
        );

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

    final updatedDue = _srsService.getDueWords(allSavedWords);
    final newIndex = state.sessionWords.isEmpty
        ? 0
        : state.currentWordIndex.clamp(0, updatedDue.length - 1);

    emit(
      state.copyWith(
        sessionWords: updatedDue,
        currentWordIndex: newIndex,
      ),
    );

    _nextWord();
  }

  void _nextWord() {
    final words = state.sessionWords;
    if (words.isEmpty) {
      emit(
        state.copyWith(
          showTranslation: false,
          currentWordIndex: 0,
        ),
      );
      return;
    }

    final newIndex = state.currentWordIndex < words.length - 1
        ? state.currentWordIndex + 1
        : 0;

    emit(
      state.copyWith(
        showTranslation: false,
        currentWordIndex: newIndex,
      ),
    );
  }
}
