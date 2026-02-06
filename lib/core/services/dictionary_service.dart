import 'dart:convert';

import 'package:fsrs/fsrs.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/database/database.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/models/learning/learning_mode.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:drift/drift.dart' as drift;

const _fromLang = 'en';
const _toLang = 'ru';
const _ui = 'ru';

class DictionaryService {
  final Talker _logger;
  final ApiClient _apiClient;
  final Database _database;
  final _scheduler = Scheduler();

  DictionaryService(this._logger, this._apiClient, this._database);

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
      await _database
          .into(_database.dictionaryCardsTable)
          .insertOnConflictUpdate(
            DictionaryCardsTableCompanion.insert(
              word: card.wordData.text,
              partOfSpeech: card.wordData.partOfSpeech,
              wordDataJson: jsonEncode(card.wordData.toJson()),
              fsrsCardJson: jsonEncode(card.fsrsCard.toMap()),
            ),
          );
      return true;
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
      await (_database.delete(_database.dictionaryCardsTable)..where(
            (tbl) =>
                tbl.word.equals(word) & tbl.partOfSpeech.equals(partOfSpeech),
          ))
          .go();
      return true;
    } catch (e) {
      _logger.error('Error deleting word $word with pos $partOfSpeech: $e');
      return false;
    }
  }

  Future<DictionaryCard?> _getDictionaryCard(
    final String word,
    final String partOfSpeech,
  ) async {
    try {
      final result =
          await (_database.select(_database.dictionaryCardsTable)..where(
                (tbl) => drift.Expression.and([
                  tbl.word.equals(word),
                  tbl.partOfSpeech.equals(partOfSpeech),
                ]),
              ))
              .getSingleOrNull();

      if (result == null) return null;

      return DictionaryCard(
        wordData: DictionaryWord.fromJson(jsonDecode(result.wordDataJson)),
        fsrsCard: Card.fromMap(jsonDecode(result.fsrsCardJson)),
      );
    } catch (e) {
      _logger.error(
        'Error retrieving single word $word with pos $partOfSpeech: $e',
      );
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

  Future<bool> checkDictionaryCardInDict(
    final String word,
    final String partOfSpeech,
  ) async {
    try {
      final result =
          await (_database.select(_database.dictionaryCardsTable)..where(
                (tbl) => drift.Expression.and([
                  tbl.word.equals(word),
                  tbl.partOfSpeech.equals(partOfSpeech),
                ]),
              ))
              .getSingleOrNull();
      return result != null;
    } catch (e) {
      _logger.error('Error checking word $word with pos $partOfSpeech: $e');
      return false;
    }
  }

  Future<List<DictionaryCard>> getListDictionaryCard() async {
    try {
      final results = await _database
          .select(_database.dictionaryCardsTable)
          .get();
      final allCards = <DictionaryCard>[];

      for (var result in results) {
        final card = DictionaryCard(
          wordData: DictionaryWord.fromJson(jsonDecode(result.wordDataJson)),
          fsrsCard: Card.fromMap(jsonDecode(result.fsrsCardJson)),
        );
        allCards.add(card);
      }

      return allCards;
    } catch (e) {
      _logger.error('Error retrieving all words: $e');
      return [];
    }
  }

  Future<DictionaryCard?> getDictionaryCard(
    final String word,
    final String partOfSpeech,
  ) async {
    return _getDictionaryCard(word, partOfSpeech);
  }

  /// Получить карточки, которые нужно повторить сейчас
  Future<List<DictionaryCard>> getDueCards({DateTime? now}) async {
    final reviewTime = now ?? DateTime.now().toUtc();
    final cards = await getListDictionaryCard();

    return cards.where((card) {
      return card.fsrsCard.due.isBefore(reviewTime) ||
          card.fsrsCard.due.isAtSameMomentAs(reviewTime);
    }).toList();
  }

  /// Получить количество карточек для повторения
  Future<int> getDueCardsCount({DateTime? now}) async {
    final dueCards = await getDueCards(now: now);
    return dueCards.length;
  }

  /// Получить одну карточку для повторения, которая должна быть повторена первой
  Future<DictionaryCard?> getDueCard(LearningMode mode) async {
    final dueCards = await getDueCards();
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
