import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/srs/srs_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/srs_service.dart';
import 'package:nim2book_mobile_flutter/features/srs/models/srs_item.dart';

class SrsNotifier extends Notifier<SrsState> {
  late final SrsService _srsService;

  @override
  SrsState build() {
    final service = ref.watch(srsServiceProvider);
    _srsService = service;
    _loadSrsData();
    return const SrsState();
  }

  Future<void> _loadSrsData() async {
    state = state.copyWith(isLoading: true);
    try {
      // SRS service работает с идентификаторами, которые нужно получать из словаря
      // Здесь просто загружаем базовую статистику
      final currentStreak = _srsService.getStudyStreakDays();
      final longestStreak = _srsService.getStudyStreakRecord();
      final dailyNewCount = _srsService.getDailyNewCount();
      final dailyLimit = _srsService.getDailyNewLimit();

      state = state.copyWith(
        reviewedToday: dailyNewCount,
        currentStreak: currentStreak,
        longestStreak: longestStreak,
        dailyLimit: dailyLimit,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> updateDueWords(List<String> identifiers) async {
    final dueWords = _srsService.getDueWords(identifiers);
    final totalDueCount = _srsService.getDueCount(identifiers);

    state = state.copyWith(dueWords: dueWords, totalDueCount: totalDueCount);
  }

  Future<void> reviewWord(String identifier, int rating) async {
    // Rating: 1=Again, 2=Hard, 3=Good, 4=Easy
    final srsRating = _ratingToSrsRating(rating);
    _srsService.updateWithRating(identifier, srsRating);
    await _loadSrsData();
  }

  SrsRating _ratingToSrsRating(int rating) {
    switch (rating) {
      case 1:
        return SrsRating.again;
      case 2:
        return SrsRating.hard;
      case 3:
        return SrsRating.good;
      case 4:
        return SrsRating.easy;
      default:
        return SrsRating.good;
    }
  }

  Future<void> setDailyLimit(int limit) async {
    await _srsService.setDailyNewLimit(limit);
    await _loadSrsData();
  }

  int getStudyStreakDays() {
    return _srsService.getStudyStreakDays();
  }

  int getStudyStreakRecord() {
    return _srsService.getStudyStreakRecord();
  }

  Future<void> refresh() async {
    await _loadSrsData();
  }
}

final srsNotifierProvider = NotifierProvider.autoDispose<SrsNotifier, SrsState>(
  SrsNotifier.new,
);
