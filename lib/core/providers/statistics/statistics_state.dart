import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_state.freezed.dart';

@freezed
sealed class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(0) int countLearnedCards,
    @Default(0) int countLearningCards,
    @Default(0) int countRelearningCards,
  }) = _StatisticsState;
}
