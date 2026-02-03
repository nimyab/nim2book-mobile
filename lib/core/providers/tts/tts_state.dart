import 'package:freezed_annotation/freezed_annotation.dart';

part 'tts_state.freezed.dart';

@freezed
sealed class TtsState with _$TtsState {
  const factory TtsState({
    @Default(false) bool isPlaying,
    @Default('zh-CN') String language,
    String? currentText,
    String? errorMessage,
  }) = _TtsState;
}
