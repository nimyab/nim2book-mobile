import 'package:shared_preferences/shared_preferences.dart';

class StatisticService {
  final SharedPreferences _sharedPreferences;

  StatisticService(this._sharedPreferences);

  static const String _dailyNewCountKey = 'statistic_daily_new_count';
  static const String _dailyNewDateKey = 'statistic_daily_new_date';

  // Ключи для стриков
  static const String _streakCurrentKey = 'statistic_streak_current';
  static const String _streakRecordKey = 'statistic_streak_record';
  static const String _streakLastDateKey = 'statistic_streak_last_date';

  // Префиксы для дневной статистики
  static const String _learnedPrefix = 'stats_learned_';
  static const String _repeatedPrefix = 'stats_repeated_';

  bool _isSameCalendarDay(final DateTime a, final DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _dateKey(final DateTime date) =>
      date.toIso8601String().substring(0, 10);

  // ============================================================
  // ЗАПИСЬ СТАТИСТИКИ ПО ДНЯМ
  // ============================================================

  /// Записать, что карточка была заучена (перешла из State.Learning в State.Review)
  Future<void> recordCardLearned(final DateTime date) async {
    final key = '$_learnedPrefix${_dateKey(date)}';
    final current = _sharedPreferences.getInt(key) ?? 0;
    await _sharedPreferences.setInt(key, current + 1);
    // Помечаем что сегодня учились
    _registerStudyToday();
  }

  /// Записать, что карточка была повторена (пользователь ответил Rating.Good)
  Future<void> recordCardRepeated(final DateTime date) async {
    final key = '$_repeatedPrefix${_dateKey(date)}';
    final current = _sharedPreferences.getInt(key) ?? 0;
    await _sharedPreferences.setInt(key, current + 1);
    // Помечаем что сегодня учились
    _registerStudyToday();
  }

  // ============================================================
  // ЧТЕНИЕ СТАТИСТИКИ ПО ДНЯМ
  // ============================================================

  /// Получить количество заученных карточек за дату
  int getLearnedCountForDate(final DateTime date) {
    final key = '$_learnedPrefix${_dateKey(date)}';
    return _sharedPreferences.getInt(key) ?? 0;
  }

  /// Получить количество повторенных карточек за дату
  int getRepeatedCountForDate(final DateTime date) {
    final key = '$_repeatedPrefix${_dateKey(date)}';
    return _sharedPreferences.getInt(key) ?? 0;
  }

  /// Получить количество заученных карточек за период
  int getLearnedCountForPeriod(final DateTime start, final DateTime end) {
    var total = 0;
    var current = DateTime(start.year, start.month, start.day);
    final endDay = DateTime(end.year, end.month, end.day);

    while (!current.isAfter(endDay)) {
      total += getLearnedCountForDate(current);
      current = current.add(const Duration(days: 1));
    }
    return total;
  }

  /// Получить количество повторенных карточек за период
  int getRepeatedCountForPeriod(final DateTime start, final DateTime end) {
    var total = 0;
    var current = DateTime(start.year, start.month, start.day);
    final endDay = DateTime(end.year, end.month, end.day);

    while (!current.isAfter(endDay)) {
      total += getRepeatedCountForDate(current);
      current = current.add(const Duration(days: 1));
    }
    return total;
  }

  /// Получить статистику по массиву дат (для графиков)
  List<int> getLearnedCountsForDates(final List<DateTime> dates) {
    return dates.map((date) => getLearnedCountForDate(date)).toList();
  }

  /// Получить статистику по массиву дат (для графиков)
  List<int> getRepeatedCountsForDates(final List<DateTime> dates) {
    return dates.map((date) => getRepeatedCountForDate(date)).toList();
  }

  // ============================================================
  // СТРИКИ
  // ============================================================

  /// Зарегистрировать активность за сегодняшний день и обновить стрик
  void _registerStudyToday() {
    final n = DateTime.now();
    final lastStr = _sharedPreferences.getString(_streakLastDateKey);

    if (lastStr == null) {
      final record = _sharedPreferences.getInt(_streakRecordKey) ?? 0;
      _sharedPreferences.setString(_streakLastDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_streakCurrentKey, 1);
      if (record < 1) {
        _sharedPreferences.setInt(_streakRecordKey, 1);
      }
      return;
    }

    final last = DateTime.tryParse(lastStr) ?? n;
    if (_isSameCalendarDay(last, n)) return;

    var current = _sharedPreferences.getInt(_streakCurrentKey) ?? 0;
    var record = _sharedPreferences.getInt(_streakRecordKey) ?? 0;

    final lastIsYesterday = _isSameCalendarDay(
      last.add(const Duration(days: 1)),
      n,
    );
    current = lastIsYesterday ? current + 1 : 1;

    if (current > record) record = current;
    _sharedPreferences.setString(_streakLastDateKey, n.toIso8601String());
    _sharedPreferences.setInt(_streakCurrentKey, current);
    _sharedPreferences.setInt(_streakRecordKey, record);
  }

  /// Получить текущий стрик дней подряд
  int getStudyStreakDays() {
    final n = DateTime.now();

    final lastStr = _sharedPreferences.getString(_streakLastDateKey);
    if (lastStr == null) return 0;

    final last = DateTime.tryParse(lastStr);
    if (last == null) return _sharedPreferences.getInt(_streakCurrentKey) ?? 0;

    final current = _sharedPreferences.getInt(_streakCurrentKey) ?? 0;
    final diff = n.difference(last).inDays;
    if (diff > 1) return 0;
    return current;
  }

  /// Получить рекордный стрик дней подряд
  int getStudyStreakRecord() {
    return _sharedPreferences.getInt(_streakRecordKey) ?? 0;
  }

  // ============================================================
  // ДНЕВНОЙ ЛИМИТ И СЧЕТЧИК НОВЫХ СЛОВ
  // ============================================================

  /// Получить количество новых слов, изученных сегодня
  int getDailyNewCount() {
    final n = DateTime.now();
    final dateStr = _sharedPreferences.getString(_dailyNewDateKey);
    final count = _sharedPreferences.getInt(_dailyNewCountKey) ?? 0;
    if (dateStr == null) {
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 0);
      return 0;
    }

    final storedDate = DateTime.tryParse(dateStr) ?? n;

    if (!_isSameCalendarDay(storedDate, n)) {
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 0);
      return 0;
    }
    return count;
  }

  /// Увеличить счетчик новых слов за сегодня
  void incrementDailyNewCount() {
    final n = DateTime.now();
    final dateStr = _sharedPreferences.getString(_dailyNewDateKey);
    if (dateStr == null) {
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 1);
      return;
    }

    final storedDate = DateTime.tryParse(dateStr) ?? n;

    if (!_isSameCalendarDay(storedDate, n)) {
      _sharedPreferences.setString(_dailyNewDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_dailyNewCountKey, 1);
    } else {
      final prev = _sharedPreferences.getInt(_dailyNewCountKey) ?? 0;
      _sharedPreferences.setInt(_dailyNewCountKey, prev + 1);
    }
  }
}
