import 'package:freezed_annotation/freezed_annotation.dart';

part 'srs_state.freezed.dart';

@freezed
sealed class SrsState with _$SrsState {
  const factory SrsState({
    @Default([]) List<String> dueWords,
    @Default(0) int totalDueCount,
    @Default(0) int reviewedToday,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(15) int dailyLimit,
    @Default(false) bool isLoading,
  }) = _SrsState;
}
