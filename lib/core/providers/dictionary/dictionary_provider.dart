import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsrs/fsrs.dart';
import 'package:nim2book_mobile_flutter/core/models/learning/learning_mode.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_state.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';

class DictionaryNotifier extends Notifier<DictionaryState> {
  late final DictionaryService _dictionaryService;

  @override
  DictionaryState build() {
    _dictionaryService = ref.read(dictionaryServiceProvider);
    // Load initial data asynchronously
    _loadInitialData();
    return const DictionaryState(savedCards: []);
  }

  Future<void> _loadInitialData() async {
    final cards = await _dictionaryService.getListDictionaryCard();
    state = state.copyWith(savedCards: cards);
  }

  Future<bool> saveWord(
    final String word,
    final DictionaryWord wordData,
  ) async {
    final dictionaryCard = await _dictionaryService.saveWord(wordData);
    if (dictionaryCard != null) {
      if (state.savedCards.any(
        (e) =>
            e.wordData.text == wordData.text &&
            e.wordData.partOfSpeech == wordData.partOfSpeech,
      )) {
        // Если карточка уже существует, обновляем её
        final updatedCards = state.savedCards.map((card) {
          if (card.wordData.text == wordData.text &&
              card.wordData.partOfSpeech == wordData.partOfSpeech) {
            return dictionaryCard;
          }
          return card;
        }).toList();
        state = state.copyWith(savedCards: updatedCards);
      } else {
        // Если карточки нет, добавляем её в список
        final updated = [...state.savedCards, dictionaryCard];
        state = state.copyWith(savedCards: updated);
      }
    }
    return dictionaryCard != null;
  }

  Future<bool> deleteWord(final String word, final String partOfSpeech) async {
    final ok = await _dictionaryService.deleteWord(word, partOfSpeech);
    if (ok) {
      final updated = state.savedCards
          .where(
            (card) =>
                !(card.wordData.text == word &&
                    card.wordData.partOfSpeech == partOfSpeech),
          )
          .toList();
      state = state.copyWith(savedCards: updated);
    }
    return ok;
  }

  Future<List<DictionaryWord>?> getWordLocalFirst(final String word) async {
    final saved = state.savedCards
        .where((card) => card.wordData.text == word)
        .toList();
    if (saved.isNotEmpty) return saved.map((e) => e.wordData).toList();
    return _dictionaryService.getWord(word);
  }

  Future<List<DictionaryWord>?> getWordServiceFirst(final String word) async {
    final wordFromServer = await _dictionaryService.getWord(word);
    if (wordFromServer != null) return wordFromServer;
    return state.savedCards
        .where((card) => card.wordData.text == word)
        .map((e) => e.wordData)
        .toList();
  }

  Future<bool> checkWordInDict(
    final String word,
    final String partOfSpeech,
  ) async {
    return state.savedCards.any(
      (w) => w.wordData.partOfSpeech == partOfSpeech && w.wordData.text == word,
    );
  }

  /// Обновить карточку после ответа пользователя на карточку в учебной сессии
  Future<DictionaryCard> reviewCard({
    required DictionaryCard card,
    required Rating rating,
  }) async {
    return _dictionaryService.reviewCard(card: card, rating: rating);
  }

  /// Сбросить состояние карточки (вернуть к начальному состоянию)
  Future<void> resetCard(DictionaryCard card) async {
    return _dictionaryService.resetCard(card);
  }

  /// Получить одну карточку для повторения, которая должна быть повторена первой
  Future<DictionaryCard?> getDueCard(LearningMode mode) async {
    return _dictionaryService.getDueCard(mode);
  }
}

final dictionaryNotifierProvider =
    NotifierProvider<DictionaryNotifier, DictionaryState>(
      DictionaryNotifier.new,
    );

final dictionaryCardsProvider = Provider<List<DictionaryCard>>((ref) {
  return ref.watch(
    dictionaryNotifierProvider.select((state) => state.savedCards),
  );
});
