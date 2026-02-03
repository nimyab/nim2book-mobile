import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
sealed class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(false) bool isCompleted,
    @Default(0) int currentPage,
    @Default(false) bool isLoading,
  }) = _OnboardingState;
}
