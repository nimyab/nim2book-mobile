import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../srs/srs_item.dart';
import '../srs/srs_scheduler_sm2.dart';

String _srsKey(String word) => 'srs_item_$word';

class SrsService {
  final SharedPreferences _sharedPreferences = GetIt.I.get<SharedPreferences>();
  final SrsSchedulerSM2 _scheduler = const SrsSchedulerSM2();

  // Наблюдаемый счётчик новых слов за день для авто‑обновления UI
  late final ValueNotifier<int> dailyNewCountNotifier = ValueNotifier<int>(
    _getDailyNewCount(),
  );

  // Дневной лимит новых слов
  static const int _defaultMaxNewPerDay = 15;
  static const String _dailyNewCountKey = 'srs_daily_new_count';
  static const String _dailyNewDateKey = 'srs_daily_new_date';
  static const String _dailyNewLimitKey = 'srs_daily_new_limit';

  bool _isSameCalendarDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  int _getDailyNewCount({DateTime? now}) {
    final n = now ?? DateTime.now();
    final dateStr = _sharedPreferences.getString(_dailyNewDateKey);
    final count = _sharedPreferences.getInt(_dailyNewCountKey) ?? 0;
    if (dateStr == null) {
      // Инициализация
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 0);
      return 0;
    }
    DateTime storedDate;
    try {
      storedDate = DateTime.parse(dateStr);
    } catch (_) {
      storedDate = n;
    }
    if (!_isSameCalendarDay(storedDate, n)) {
      // Новый день — сброс счётчика
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 0);
      return 0;
    }
    return count;
  }

  // Публичный доступ к дневному счётчику новых слов
  int getDailyNewCount({DateTime? now}) => _getDailyNewCount(now: now);

  // Текущий лимит новых слов в день (читается из настроек)
  int getDailyNewLimit() {
    return _sharedPreferences.getInt(_dailyNewLimitKey) ?? _defaultMaxNewPerDay;
  }

  // Сохранение нового лимита
  Future<void> setDailyNewLimit(int value) async {
    await _sharedPreferences.setInt(_dailyNewLimitKey, value);
  }

  void _incrementDailyNewCount({DateTime? now}) {
    final n = now ?? DateTime.now();
    final dateStr = _sharedPreferences.getString(_dailyNewDateKey);
    if (dateStr == null) {
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 1);
      dailyNewCountNotifier.value = _getDailyNewCount(now: n);
      return;
    }
    DateTime storedDate;
    try {
      storedDate = DateTime.parse(dateStr);
    } catch (_) {
      storedDate = n;
    }
    if (!_isSameCalendarDay(storedDate, n)) {
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 1);
      dailyNewCountNotifier.value = _getDailyNewCount(now: n);
    } else {
      final prev = _sharedPreferences.getInt(_dailyNewCountKey) ?? 0;
      _sharedPreferences.setInt(_dailyNewCountKey, prev + 1);
      dailyNewCountNotifier.value = _getDailyNewCount(now: n);
    }
  }

  SrsItem getOrCreateItem(String word) {
    final jsonStr = _sharedPreferences.getString(_srsKey(word));
    if (jsonStr == null) {
      final item = SrsItem.initial(word);
      _sharedPreferences.setString(_srsKey(word), jsonEncode(item.toJson()));
      return item;
    }
    try {
      final jsonMap = jsonDecode(jsonStr) as Map<String, dynamic>;
      return SrsItem.fromJson(jsonMap);
    } catch (_) {
      final item = SrsItem.initial(word);
      _sharedPreferences.setString(_srsKey(word), jsonEncode(item.toJson()));
      return item;
    }
  }

  void upsertItem(SrsItem item) {
    _sharedPreferences.setString(_srsKey(item.word), jsonEncode(item.toJson()));
  }

  SrsItem updateWithRating(String word, SrsRating rating) {
    final item = getOrCreateItem(word);
    final wasNeverReviewed = item.lastReviewedAt == null;
    final updated = _scheduler.updateOnRating(item, rating);
    // Если слово изучено впервые — увеличиваем дневной счётчик новых слов
    if (wasNeverReviewed) {
      _incrementDailyNewCount(now: updated.lastReviewedAt);
    }
    upsertItem(updated);
    return updated;
  }

  int getDueCount(Iterable<String> words, {DateTime? now}) {
    final n = now ?? DateTime.now();
    int count = 0;
    for (final word in words) {
      final item = getOrCreateItem(word);
      if (!item.nextReviewAt.isAfter(n)) {
        count++;
      }
    }
    return count;
  }

  List<String> getDueWords(Iterable<String> words, {DateTime? now}) {
    final n = now ?? DateTime.now();
    final reviewDue = <String>[]; // уже изученные слова к повторению
    final newDue = <String>[]; // совершенно новые слова

    for (final word in words) {
      final item = getOrCreateItem(word);
      if (!item.nextReviewAt.isAfter(n)) {
        if (item.lastReviewedAt == null) {
          newDue.add(word);
        } else {
          reviewDue.add(word);
        }
      }
    }

    final alreadyStartedToday = _getDailyNewCount(now: n);
    final maxNewPerDay = getDailyNewLimit();
    final availableSlots = (maxNewPerDay - alreadyStartedToday).clamp(
      0,
      maxNewPerDay,
    );
    final limitedNew = availableSlots > 0
        ? newDue.take(availableSlots).toList()
        : const <String>[];

    return [...reviewDue, ...limitedNew];
  }
}
