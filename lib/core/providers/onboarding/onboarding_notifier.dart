import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/onboarding/onboarding_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/onboarding_service.dart';

class OnboardingNotifier extends AutoDisposeNotifier<OnboardingState> {
  late final OnboardingService _onboardingService;

  @override
  OnboardingState build() {
    final service = ref.watch(onboardingServiceProvider);
    _onboardingService = service;
    _loadOnboardingStatus();
    return const OnboardingState();
  }

  Future<void> _loadOnboardingStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final isCompleted = _onboardingService.isOnboardingComplete;
      state = state.copyWith(isCompleted: isCompleted, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setCurrentPage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void nextPage() {
    state = state.copyWith(currentPage: state.currentPage + 1);
  }

  void previousPage() {
    if (state.currentPage > 0) {
      state = state.copyWith(currentPage: state.currentPage - 1);
    }
  }

  Future<void> completeOnboarding() async {
    state = state.copyWith(isLoading: true);
    try {
      await _onboardingService.completeOnboarding();
      state = state.copyWith(isCompleted: true, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> resetOnboarding() async {
    state = state.copyWith(isLoading: true);
    try {
      await _onboardingService.resetOnboarding();
      state = state.copyWith(
        isCompleted: false,
        currentPage: 0,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> refresh() async {
    await _loadOnboardingStatus();
  }
}

final onboardingNotifierProvider =
    AutoDisposeNotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );
