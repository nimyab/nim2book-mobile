import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.freezed.dart';

@freezed
sealed class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0) int dailyNewCount,
    @Default(15) int dailyLimit,
    @Default(false) bool isLoading,
  }) = _StatisticsState;
}
