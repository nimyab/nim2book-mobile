import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/statistics/statistics_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/statistic_service.dart';

class StatisticsNotifier extends Notifier<StatisticsState> {
  late final StatisticService _statisticService;

  @override
  StatisticsState build() {
    final service = ref.watch(statisticServiceProvider);
    _statisticService = service;
    _loadStatistics();
    return const StatisticsState();
  }

  Future<void> _loadStatistics() async {
    state = state.copyWith(isLoading: true);
    try {
      final currentStreak = _statisticService.getStudyStreakDays();
      final longestStreak = _statisticService.getStudyStreakRecord();
      final dailyNewCount = _statisticService.getDailyNewCount();
      final dailyLimit = _statisticService.getDailyNewLimit();

      state = state.copyWith(
        currentStreak: currentStreak,
        longestStreak: longestStreak,
        dailyNewCount: dailyNewCount,
        dailyLimit: dailyLimit,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> setDailyLimit(int limit) async {
    await _statisticService.setDailyNewLimit(limit);
    await _loadStatistics();
  }

  void incrementDailyNewCount() {
    _statisticService.incrementDailyNewCount();
    _loadStatistics();
  }

  void registerStudyToday() {
    _statisticService.registerStudyToday();
    _loadStatistics();
  }

  int getStudyStreakDays() {
    return _statisticService.getStudyStreakDays();
  }

  int getStudyStreakRecord() {
    return _statisticService.getStudyStreakRecord();
  }

  int getDailyNewCount() {
    return _statisticService.getDailyNewCount();
  }

  int getDailyNewLimit() {
    return _statisticService.getDailyNewLimit();
  }

  Future<void> refresh() async {
    await _loadStatistics();
  }
}

final statisticsNotifierProvider =
    NotifierProvider.autoDispose<StatisticsNotifier, StatisticsState>(
      StatisticsNotifier.new,
    );
