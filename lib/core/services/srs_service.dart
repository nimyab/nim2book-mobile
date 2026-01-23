import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/features/srs/logic/srs_scheduler_sm2.dart';
import 'package:nim2book_mobile_flutter/features/srs/models/srs_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Создаёт ключ для хранения SRS элемента
/// identifier - это либо просто слово, либо word_partOfSpeech
String _srsKey(final String identifier) => 'srs_item_$identifier';

/// Создаёт уникальный идентификатор из слова и части речи
/// Формат: "word_partOfSpeech" или "word" если часть речи null
String _createIdentifier(String word, String? partOfSpeech) {
  if (partOfSpeech == null || partOfSpeech.isEmpty) {
    return word;
  }
  return '${word}_$partOfSpeech';
}

/// Создаёт идентификатор из DictionaryWord
String _identifierFromDictionaryWord(DictionaryWord word) {
  return _createIdentifier(word.text, word.partOfSpeech);
}

/// Извлекает слово из идентификатора
String _extractWord(String identifier) {
  final parts = identifier.split('_');
  return parts.first;
}

/// Извлекает часть речи из идентификатора
/// Возвращает null если часть речи не указана
String? _extractPartOfSpeech(String identifier) {
  final parts = identifier.split('_');
  if (parts.length < 2) return null;
  return parts.sublist(1).join('_');
}

/// Создаёт список идентификаторов из `Map<String, List<DictionaryWord>>`
List<String> _identifiersFromSavedWords(
  Map<String, List<DictionaryWord>> savedWords,
) {
  final identifiers = <String>[];
  for (final entry in savedWords.entries) {
    for (final word in entry.value) {
      identifiers.add(_identifierFromDictionaryWord(word));
    }
  }
  return identifiers;
}

/// Находит DictionaryWord по идентификатору в savedWords
DictionaryWord? _findWordByIdentifier(
  String identifier,
  Map<String, List<DictionaryWord>> savedWords,
) {
  final word = _extractWord(identifier);
  final partOfSpeech = _extractPartOfSpeech(identifier);
  final words = savedWords[word];
  if (words == null) return null;

  return words.firstWhere(
    (w) => w.partOfSpeech == partOfSpeech,
    orElse: () => words.first,
  );
}

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

  static const String _streakCurrentKey = 'srs_streak_current';
  static const String _streakRecordKey = 'srs_streak_record';
  static const String _streakLastDateKey = 'srs_streak_last_date';

  bool _isSameCalendarDay(final DateTime a, final DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  int _getDailyNewCount({final DateTime? now}) {
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
  int getDailyNewCount({final DateTime? now}) => _getDailyNewCount(now: now);

  // Текущий лимит новых слов в день (читается из настроек)
  int getDailyNewLimit() {
    return _sharedPreferences.getInt(_dailyNewLimitKey) ?? _defaultMaxNewPerDay;
  }

  // Сохранение нового лимита
  Future<void> setDailyNewLimit(final int value) async {
    await _sharedPreferences.setInt(_dailyNewLimitKey, value);
  }

  void _registerStudyToday({final DateTime? now}) {
    final n = now ?? DateTime.now();
    final lastStr = _sharedPreferences.getString(_streakLastDateKey);
    var current = _sharedPreferences.getInt(_streakCurrentKey) ?? 0;
    var record = _sharedPreferences.getInt(_streakRecordKey) ?? 0;

    if (lastStr == null) {
      _sharedPreferences.setString(_streakLastDateKey, n.toIso8601String());
      _sharedPreferences.setInt(_streakCurrentKey, 1);
      if (record < 1) {
        _sharedPreferences.setInt(_streakRecordKey, 1);
      }
      return;
    }

    DateTime last;
    try {
      last = DateTime.parse(lastStr);
    } catch (_) {
      last = n;
    }

    final sameDay = _isSameCalendarDay(last, n);
    if (sameDay) {
      return;
    }

    final yesterday = last.add(const Duration(days: 1));
    if (_isSameCalendarDay(yesterday, n)) {
      current += 1;
    } else {
      current = 1;
    }
    if (current > record) record = current;
    _sharedPreferences.setString(_streakLastDateKey, n.toIso8601String());
    _sharedPreferences.setInt(_streakCurrentKey, current);
    _sharedPreferences.setInt(_streakRecordKey, record);
  }

  int getStudyStreakDays({final DateTime? now}) {
    final n = now ?? DateTime.now();
    final lastStr = _sharedPreferences.getString(_streakLastDateKey);
    if (lastStr == null) return 0;
    DateTime last;
    try {
      last = DateTime.parse(lastStr);
    } catch (_) {
      return _sharedPreferences.getInt(_streakCurrentKey) ?? 0;
    }
    final current = _sharedPreferences.getInt(_streakCurrentKey) ?? 0;
    final diff = DateTime(
      n.year,
      n.month,
      n.day,
    ).difference(DateTime(last.year, last.month, last.day)).inDays;
    if (diff > 1) return 0;
    return current;
  }

  int getStudyStreakRecord() {
    return _sharedPreferences.getInt(_streakRecordKey) ?? 0;
  }

  void _incrementDailyNewCount({final DateTime? now}) {
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

  /// Получает или создаёт SRS элемент для идентификатора (word или word_partOfSpeech)
  SrsItem getOrCreateItem(final String identifier) {
    final jsonStr = _sharedPreferences.getString(_srsKey(identifier));
    if (jsonStr == null) {
      final item = SrsItem.initial(identifier);
      _sharedPreferences.setString(
        _srsKey(identifier),
        jsonEncode(item.toJson()),
      );
      return item;
    }
    try {
      final jsonMap = jsonDecode(jsonStr) as Map<String, dynamic>;
      return SrsItem.fromJson(jsonMap);
    } catch (_) {
      final item = SrsItem.initial(identifier);
      _sharedPreferences.setString(
        _srsKey(identifier),
        jsonEncode(item.toJson()),
      );
      return item;
    }
  }

  void upsertItem(final SrsItem item) {
    _sharedPreferences.setString(_srsKey(item.word), jsonEncode(item.toJson()));
  }

  /// Обновляет рейтинг для идентификатора (word или word_partOfSpeech)
  SrsItem updateWithRating(final String identifier, final SrsRating rating) {
    final item = getOrCreateItem(identifier);
    final wasNeverReviewed = item.lastReviewedAt == null;
    final updated = _scheduler.updateOnRating(item, rating);
    // Если слово изучено впервые — увеличиваем дневной счётчик новых слов
    if (wasNeverReviewed) {
      _incrementDailyNewCount(now: updated.lastReviewedAt);
    }
    _registerStudyToday(now: updated.lastReviewedAt);
    upsertItem(updated);
    return updated;
  }

  /// Получает количество идентификаторов к повторению
  int getDueCount(final Iterable<String> identifiers, {final DateTime? now}) {
    final n = now ?? DateTime.now();
    var count = 0;
    for (final identifier in identifiers) {
      final item = getOrCreateItem(identifier);
      if (!item.nextReviewAt.isAfter(n)) {
        count++;
      }
    }
    return count;
  }

  /// Получает список идентификаторов к повторению (с учётом лимита новых слов)
  List<String> getDueWords(
    final Iterable<String> identifiers, {
    final DateTime? now,
  }) {
    final n = now ?? DateTime.now();
    final reviewDue = <String>[]; // уже изученные элементы к повторению
    final newDue = <String>[]; // совершенно новые элементы

    for (final identifier in identifiers) {
      final item = getOrCreateItem(identifier);
      if (!item.nextReviewAt.isAfter(n)) {
        if (item.lastReviewedAt == null) {
          newDue.add(identifier);
        } else {
          reviewDue.add(identifier);
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

  /// Создаёт список идентификаторов из сохранённых слов
  List<String> getIdentifiersFromSavedWords(
    Map<String, List<DictionaryWord>> savedWords,
  ) {
    return _identifiersFromSavedWords(savedWords);
  }

  /// Находит DictionaryWord по идентификатору
  DictionaryWord? findWordByIdentifier(
    String identifier,
    Map<String, List<DictionaryWord>> savedWords,
  ) {
    return _findWordByIdentifier(identifier, savedWords);
  }

  /// Извлекает слово из идентификатора
  String extractWord(String identifier) {
    return _extractWord(identifier);
  }

  /// Создаёт идентификатор из DictionaryWord
  String createIdentifier(DictionaryWord word) {
    return _identifierFromDictionaryWord(word);
  }

  /// Мигрирует старые SRS данные (по словам) на новый формат (по идентификаторам)
  /// Должен вызываться при старте приложения если в словаре есть слова с частями речи
  Future<void> migrateLegacySrsData(
    Map<String, List<DictionaryWord>> savedWords,
  ) async {
    for (final entry in savedWords.entries) {
      final word = entry.key;
      final dictionaryWords = entry.value;

      // Проверяем, есть ли старая запись для этого слова
      final legacyKey = _srsKey(word);
      final legacyJson = _sharedPreferences.getString(legacyKey);

      if (legacyJson != null && dictionaryWords.isNotEmpty) {
        try {
          // Читаем старую запись
          final jsonMap = jsonDecode(legacyJson) as Map<String, dynamic>;
          final legacyItem = SrsItem.fromJson(jsonMap);

          // Для каждой части речи создаём новую запись с тем же прогрессом
          for (final dictionaryWord in dictionaryWords) {
            final identifier = _identifierFromDictionaryWord(dictionaryWord);
            final newKey = _srsKey(identifier);

            // Проверяем, не существует ли уже новая запись
            if (!_sharedPreferences.containsKey(newKey)) {
              // Создаём новый элемент с данными из старой записи
              final newItem = SrsItem(
                word: identifier,
                easiness: legacyItem.easiness,
                intervalDays: legacyItem.intervalDays,
                repetition: legacyItem.repetition,
                lastReviewedAt: legacyItem.lastReviewedAt,
                nextReviewAt: legacyItem.nextReviewAt,
              );
              _sharedPreferences.setString(
                newKey,
                jsonEncode(newItem.toJson()),
              );
            }
          }

          // Удаляем старую запись после успешной миграции
          unawaited(_sharedPreferences.remove(legacyKey));
        } catch (e) {
          // Игнорируем ошибки миграции для конкретного слова
          debugPrint('Error migrating SRS data for word "$word": $e');
        }
      }
    }
  }
}
