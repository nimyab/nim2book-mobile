import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticService {
  final SharedPreferences _sharedPreferences = GetIt.I.get<SharedPreferences>();

  // Дневной лимит новых слов
  static const int _defaultMaxNewPerDay = 15;
  static const String _dailyNewCountKey = 'srs_daily_new_count';
  static const String _dailyNewDateKey = 'srs_daily_new_date';
  static const String _dailyNewLimitKey = 'srs_daily_new_limit';

  static const String _streakCurrentKey = 'srs_streak_current';
  static const String _streakRecordKey = 'srs_streak_record';
  static const String _streakLastDateKey = 'srs_streak_last_date';

  // Наблюдаемый счётчик новых слов за день для авто‑обновления UI
  late final ValueNotifier<int> dailyNewCountNotifier = ValueNotifier<int>(
    _getDailyNewCount(),
  );

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

  void incrementDailyNewCount({final DateTime? now}) {
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

  void registerStudyToday({final DateTime? now}) {
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

  /// Создаёт уникальный идентификатор из слова и части речи
  /// Формат: "word_partOfSpeech" или "word" если часть речи null
  String createIdentifier(String word, String? partOfSpeech) {
    if (partOfSpeech == null || partOfSpeech.isEmpty) {
      return word;
    }
    return '${word}_$partOfSpeech';
  }

  /// Создаёт идентификатор из DictionaryWord
  String identifierFromDictionaryWord(DictionaryWord word) {
    return createIdentifier(word.text, word.partOfSpeech);
  }

  /// Извлекает слово из идентификатора
  String extractWord(String identifier) {
    final parts = identifier.split('_');
    return parts.first;
  }

  /// Извлекает часть речи из идентификатора
  /// Возвращает null если часть речи не указана
  String? extractPartOfSpeech(String identifier) {
    final parts = identifier.split('_');
    if (parts.length < 2) return null;
    return parts.sublist(1).join('_');
  }

  /// Создаёт список идентификаторов из `Map<String, List<DictionaryWord>>`
  List<String> getIdentifiersFromSavedWords(
    Map<String, List<DictionaryWord>> savedWords,
  ) {
    final identifiers = <String>[];
    for (final entry in savedWords.entries) {
      for (final word in entry.value) {
        identifiers.add(identifierFromDictionaryWord(word));
      }
    }
    return identifiers;
  }

  /// Находит DictionaryWord по идентификатору в savedWords
  DictionaryWord? findWordByIdentifier(
    String identifier,
    Map<String, List<DictionaryWord>> savedWords,
  ) {
    final word = extractWord(identifier);
    final partOfSpeech = extractPartOfSpeech(identifier);
    final words = savedWords[word];
    if (words == null) return null;

    return words.firstWhere(
      (w) => w.partOfSpeech == partOfSpeech,
      orElse: () => words.first,
    );
  }

  /// Проверяет, является ли карточка новой (никогда не изучалась)
  bool isNewCard(DictionaryCard card) {
    // В FSRS карточка новая, если step = 0 (State.newState)
    return card.fsrsCard.step == 0;
  }

  /// Проверяет, нужно ли повторить карточку сейчас
  bool isDueCard(DictionaryCard card, {DateTime? now}) {
    final reviewTime = now ?? DateTime.now().toUtc();
    return card.fsrsCard.due.isBefore(reviewTime) ||
        card.fsrsCard.due.isAtSameMomentAs(reviewTime);
  }

  /// Получает количество карточек к повторению
  int getDueCount(final Iterable<DictionaryCard> cards, {final DateTime? now}) {
    return cards.where((card) => isDueCard(card, now: now)).length;
  }

  /// Получает карточки к повторению
  List<DictionaryCard> getDueCards(
    final Iterable<DictionaryCard> cards, {
    final DateTime? now,
  }) {
    return cards.where((card) => isDueCard(card, now: now)).toList();
  }

  /// Получает список карточек к повторению (с учётом лимита новых слов)
  List<DictionaryCard> getDueCardsWithLimit(
    final Iterable<DictionaryCard> cards, {
    final DateTime? now,
  }) {
    final n = now ?? DateTime.now();
    final reviewDue = <DictionaryCard>[]; // уже изученные карточки к повторению
    final newDue = <DictionaryCard>[]; // совершенно новые карточки

    for (final card in cards) {
      if (isDueCard(card, now: n)) {
        if (isNewCard(card)) {
          newDue.add(card);
        } else {
          reviewDue.add(card);
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
        : const <DictionaryCard>[];

    return [...reviewDue, ...limitedNew];
  }

  /// Получает количество новых карточек к изучению (с учетом лимита)
  int getNewDueCount(
    final Iterable<DictionaryCard> cards, {
    final DateTime? now,
  }) {
    final n = now ?? DateTime.now();
    final newDue = cards
        .where((card) => isNewCard(card) && isDueCard(card, now: n))
        .length;

    final alreadyStartedToday = _getDailyNewCount(now: n);
    final maxNewPerDay = getDailyNewLimit();
    final availableSlots = (maxNewPerDay - alreadyStartedToday).clamp(
      0,
      maxNewPerDay,
    );

    return availableSlots > 0 ? newDue.clamp(0, availableSlots) : 0;
  }

  /// Получает количество карточек на повторение (не новых)
  int getReviewDueCount(
    final Iterable<DictionaryCard> cards, {
    final DateTime? now,
  }) {
    final n = now ?? DateTime.now();
    return cards
        .where((card) => !isNewCard(card) && isDueCard(card, now: n))
        .length;
  }

  /// Подсчитывает количество выученных карточек (step >= 3)
  int countLearnedCards(final Iterable<DictionaryCard> cards) {
    // В FSRS карточка считается выученной, если она прошла начальные этапы
    // step показывает количество успешных повторений
    return cards.where((card) => (card.fsrsCard.step ?? 0) >= 3).length;
  }

  /// Подсчитывает количество повторенных карточек (step >= 1)
  int countRepeatedCards(final Iterable<DictionaryCard> cards) {
    return cards.where((card) => (card.fsrsCard.step ?? 0) >= 1).length;
  }

  /// Подсчитывает количество хорошо знакомых карточек (step >= 8)
  int countKnownCards(final Iterable<DictionaryCard> cards) {
    return cards.where((card) => (card.fsrsCard.step ?? 0) >= 8).length;
  }

  /// Фильтрует карточки, выученные впервые в указанном периоде
  Iterable<DictionaryCard> getCardsLearnedInPeriod(
    final Iterable<DictionaryCard> cards,
    final DateTime start,
    final DateTime end,
  ) {
    return cards.where((card) {
      final lastReview = card.fsrsCard.lastReview;
      if (lastReview == null) return false;
      final ds = DateTime(lastReview.year, lastReview.month, lastReview.day);
      final s = DateTime(start.year, start.month, start.day);
      final e = DateTime(end.year, end.month, end.day);
      return !ds.isBefore(s) &&
          !ds.isAfter(e) &&
          (card.fsrsCard.step ?? 0) >= 3;
    });
  }

  /// Фильтрует карточки, повторенные в указанном периоде
  Iterable<DictionaryCard> getCardsRepeatedInPeriod(
    final Iterable<DictionaryCard> cards,
    final DateTime start,
    final DateTime end,
  ) {
    return cards.where((card) {
      final lastReview = card.fsrsCard.lastReview;
      if (lastReview == null) return false;
      final ds = DateTime(lastReview.year, lastReview.month, lastReview.day);
      final s = DateTime(start.year, start.month, start.day);
      final e = DateTime(end.year, end.month, end.day);
      return !ds.isBefore(s) && !ds.isAfter(e);
    });
  }

  /// Фильтрует хорошо знакомые карточки, достигшие этого статуса в указанном периоде
  Iterable<DictionaryCard> getCardsKnownInPeriod(
    final Iterable<DictionaryCard> cards,
    final DateTime start,
    final DateTime end,
  ) {
    return cards.where((card) {
      final lastReview = card.fsrsCard.lastReview;
      if (lastReview == null) return false;
      final ds = DateTime(lastReview.year, lastReview.month, lastReview.day);
      final s = DateTime(start.year, start.month, start.day);
      final e = DateTime(end.year, end.month, end.day);
      return !ds.isBefore(s) &&
          !ds.isAfter(e) &&
          (card.fsrsCard.step ?? 0) >= 8;
    });
  }
}
