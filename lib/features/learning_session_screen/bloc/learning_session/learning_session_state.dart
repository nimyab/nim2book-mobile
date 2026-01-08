import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_session_state.freezed.dart';

@freezed
abstract class LearningSessionState with _$LearningSessionState {
  const factory LearningSessionState({
    required final List<String> sessionWords,
    required final int currentWordIndex,
    @Default(false) final bool showTranslation,
    @Default(false) final bool sessionEmpty,
    @Default(0) final int totalWordsStudied,
    @Default(0) final int initialSessionSize,
  }) = _LearningSessionState;
}
