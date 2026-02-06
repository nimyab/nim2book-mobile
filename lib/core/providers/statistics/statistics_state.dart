import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.freezed.dart';

@freezed
sealed class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    @Default(0) int dailyNewCount,
  }) = _StatisticsState;
}
