import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/statistics/statistics_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/statistic_service.dart';

class StatisticsNotifier extends Notifier<StatisticsState> {
  late final StatisticService _statisticService;

  @override
  StatisticsState build() {
    _statisticService = ref.watch(statisticServiceProvider);
    return _loadStatistics();
  }

  StatisticsState _loadStatistics() {
    final currentStreak = _statisticService.getStudyStreakDays();
    final longestStreak = _statisticService.getStudyStreakRecord();
    final dailyNewCount = _statisticService.getDailyNewCount();

    return StatisticsState(
      currentStreak: currentStreak,
      longestStreak: longestStreak,
      dailyNewCount: dailyNewCount,
    );
  }

  void incrementDailyNewCount() {
    _statisticService.incrementDailyNewCount();
    state = _loadStatistics();
  }

  void refresh() {
    state = _loadStatistics();
  }
}

final statisticsNotifierProvider =
    NotifierProvider.autoDispose<StatisticsNotifier, StatisticsState>(
      StatisticsNotifier.new,
    );
