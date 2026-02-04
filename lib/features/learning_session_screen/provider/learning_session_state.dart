import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';

part 'learning_session_state.freezed.dart';

@freezed
abstract class LearningSessionState with _$LearningSessionState {
  const factory LearningSessionState({
    required final List<DictionaryCard> sessionCards,
    required final int currentWordIndex,
    @Default(false) final bool showTranslation,
    @Default(false) final bool sessionEmpty,
    @Default(0) final int totalWordsStudied,
    @Default(0) final int initialSessionSize,
  }) = _LearningSessionState;
}
