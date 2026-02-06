import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';

part 'learning_session_state.freezed.dart';

@freezed
abstract class LearningSessionState with _$LearningSessionState {
  const factory LearningSessionState({
    required final DictionaryCard? currentCard,
    @Default(false) final bool showTranslation,
  }) = _LearningSessionState;
}
