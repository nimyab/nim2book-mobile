import 'dart:convert';

import 'package:fsrs/fsrs.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/models/learning/learning_mode.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

const _fromLang = 'en';
const _toLang = 'ru';
const _ui = 'ru';

class DictionaryService {
  final Talker _logger;
  final ApiClient _apiClient;
  final SharedPreferences _sharedPreferences;
  final _scheduler = Scheduler();

  DictionaryService(this._logger, this._apiClient, this._sharedPreferences);

  static const _dictionaryPrefix = 'dictionary_card_';

  static String _getWordKey(final String word, final String partOfSpeech) =>
      '$_dictionaryPrefix${word}_$partOfSpeech';

  Future<DictionaryCard?> saveWord(final DictionaryWord word) async {
    try {
      final dictionaryCard = DictionaryCard(
        wordData: word,
        fsrsCard: await Card.create(),
      );
      await _updateCard(dictionaryCard);
      return dictionaryCard;
    } catch (e) {
      _logger.error(
        'Error saving word ${word.text} with pos ${word.partOfSpeech}: $e',
      );
      return null;
    }
  }

  Future<bool> _updateCard(final DictionaryCard card) async {
    try {
      final dictionaryCardJson = jsonEncode(card.toJson());
      return _sharedPreferences.setString(
        _getWordKey(card.wordData.text, card.wordData.partOfSpeech),
        dictionaryCardJson,
      );
    } catch (e) {
      _logger.error(
        'Error updating card for word ${card.wordData.text} '
        'with pos ${card.wordData.partOfSpeech}: $e',
      );
      return false;
    }
  }

  Future<bool> deleteWord(final String word, final String partOfSpeech) async {
    try {
      return _sharedPreferences.remove(_getWordKey(word, partOfSpeech));
    } catch (e) {
      _logger.error('Error deleting word $word with pos $partOfSpeech: $e');
      return false;
    }
  }

  DictionaryCard? _getDictionaryCard(final String key) {
    try {
      final dictionaryCardJson = _sharedPreferences.getString(key);
      if (dictionaryCardJson == null) return null;
      return DictionaryCard.fromJson(jsonDecode(dictionaryCardJson));
    } catch (e) {
      _logger.error('Error retrieving single word $key: $e');
      return null;
    }
  }

  Future<List<DictionaryWord>?> getWord(final String word) async {
    try {
      final response = await _apiClient.lookup(
        LookupRequest(
          text: word,
          fromLang: _fromLang,
          toLang: _toLang,
          ui: _ui,
        ),
      );
      return response.words;
    } catch (e) {
      _logger.error(e);
      return null;
    }
  }

  bool checkDictionaryCardInDict(final String word, final String partOfSpeech) {
    final key = _getWordKey(word, partOfSpeech);
    return _sharedPreferences.containsKey(key);
  }

  Map<String, List<DictionaryCard>> getMapDictionaryCard() {
    try {
      final keys = _sharedPreferences.getKeys();
      final allCards = <String, List<DictionaryCard>>{};

      for (var key in keys) {
        if (key.startsWith(_dictionaryPrefix)) {
          final card = _getDictionaryCard(key);
          if (card != null) {
            final word = card.wordData.text;
            if (!allCards.containsKey(word)) {
              allCards[word] = [];
            }
            // Check if this word+pos combination already exists
            final exists = allCards[word]!.any(
              (w) => w.wordData.partOfSpeech == card.wordData.partOfSpeech,
            );
            if (!exists) {
              allCards[word]!.add(card);
            }
          }
        }
      }

      return allCards;
    } catch (e) {
      _logger.error('Error retrieving all words: $e');
      return {};
    }
  }

  List<DictionaryCard> getListDictionaryCard() {
    try {
      final keys = _sharedPreferences.getKeys();
      final allCards = <DictionaryCard>[];

      for (var key in keys) {
        if (key.startsWith(_dictionaryPrefix)) {
          final card = _getDictionaryCard(key);
          if (card != null) allCards.add(card);
        }
      }

      return allCards;
    } catch (e) {
      _logger.error('Error retrieving all words: $e');
      return [];
    }
  }

  DictionaryCard? getDictionaryCard(
    final String word,
    final String partOfSpeech,
  ) {
    final key = _getWordKey(word, partOfSpeech);
    return _getDictionaryCard(key);
  }

  /// Получить карточки, которые нужно повторить сейчас
  List<DictionaryCard> getDueCards({DateTime? now}) {
    final reviewTime = now ?? DateTime.now().toUtc();
    final cards = getListDictionaryCard();

    return cards.where((card) {
      return card.fsrsCard.due.isBefore(reviewTime) ||
          card.fsrsCard.due.isAtSameMomentAs(reviewTime);
    }).toList();
  }

  /// Получить количество карточек для повторения
  int getDueCardsCount({DateTime? now}) {
    return getDueCards(now: now).length;
  }

  /// Получить одну карточку для повторения, которая должна быть повторена первой
  DictionaryCard? getDueCard(LearningMode mode) {
    final dueCards = getDueCards();
    if (dueCards.isEmpty) return null;
    dueCards.sort((a, b) => a.fsrsCard.due.compareTo(b.fsrsCard.due));
    return dueCards.first;
  }

  /// Сбросить состояние карточки (вернуть к начальному состоянию)
  Future<void> resetCard(DictionaryCard card) async {
    final resetCard = card.copyWith(fsrsCard: await Card.create());
    await _updateCard(resetCard);
  }

  /// Обновить состояние карточки после ответа пользователя
  Future<DictionaryCard> reviewCard({
    required DictionaryCard card,
    required Rating rating,
  }) async {
    // Используем Scheduler для расчета следующего повторения
    final result = _scheduler.reviewCard(card.fsrsCard, rating);
    final updatedCard = card.copyWith(fsrsCard: result.card);

    // Сохраняем обновленную карточку
    await _updateCard(updatedCard);

    return updatedCard;
  }

  // ============================================================
  // ПРОВЕРКА СОСТОЯНИЯ КАРТОЧЕК
  // ============================================================

  /// Проверяет, нужно ли повторить карточку сейчас
  bool isDueCard(DictionaryCard card, {DateTime? now}) {
    final reviewTime = now ?? DateTime.now().toUtc();
    return card.fsrsCard.due.isBefore(reviewTime) ||
        card.fsrsCard.due.isAtSameMomentAs(reviewTime);
  }

  // ============================================================
  // ПОЛУЧЕНИЕ КАРТОЧЕК С УЧЕТОМ ЛИМИТОВ
  // ============================================================

  /// Получает количество новых карточек к изучению (с учетом лимита)
  int getNewDueCount(
    final Iterable<DictionaryCard> cards, {
    final DateTime? now,
  }) {
    return cards
        .where(
          (card) => card.fsrsCard.state == State.learning && isDueCard(card),
        )
        .length;
  }

  /// Получает количество карточек на повторение (не новых)
  int getReviewDueCount(
    final Iterable<DictionaryCard> cards, {
    final DateTime? now,
  }) {
    return cards
        .where(
          (card) => card.fsrsCard.state != State.learning && isDueCard(card),
        )
        .length;
  }
}
