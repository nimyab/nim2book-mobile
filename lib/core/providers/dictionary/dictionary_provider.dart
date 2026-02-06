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
    return DictionaryState(
      savedCards: _dictionaryService.getMapDictionaryCard(),
    );
  }

  Future<bool> saveWord(
    final String word,
    final DictionaryWord wordData,
  ) async {
    final dictionaryCard = await _dictionaryService.saveWord(wordData);
    if (dictionaryCard != null) {
      final updated = Map<String, List<DictionaryCard>>.from(state.savedCards);
      if (!updated.containsKey(word)) {
        updated[word] = [];
      }
      // Remove existing word with same partOfSpeech if any
      updated[word]!.removeWhere(
        (w) => w.wordData.partOfSpeech == wordData.partOfSpeech,
      );
      // Add new word
      updated[word]!.add(dictionaryCard);
      state = state.copyWith(savedCards: updated);
    }
    return dictionaryCard != null;
  }

  Future<bool> deleteWord(final String word, final String partOfSpeech) async {
    final ok = await _dictionaryService.deleteWord(word, partOfSpeech);
    if (ok) {
      final updated = Map<String, List<DictionaryCard>>.from(state.savedCards);
      if (updated.containsKey(word)) {
        updated[word]!.removeWhere(
          (w) => w.wordData.partOfSpeech == partOfSpeech,
        );
        if (updated[word]!.isEmpty) {
          updated.remove(word);
        }
      }
      state = state.copyWith(savedCards: updated);
    }
    return ok;
  }

  Future<List<DictionaryWord>?> getWordLocalFirst(final String word) async {
    final saved = state.savedCards[word];
    if (saved != null) return saved.map((e) => e.wordData).toList();
    return _dictionaryService.getWord(word);
  }

  Future<List<DictionaryWord>?> getWordServiceFirst(final String word) async {
    final wordFromServer = await _dictionaryService.getWord(word);
    if (wordFromServer != null) return wordFromServer;
    return state.savedCards[word]?.map((e) => e.wordData).toList();
  }

  bool checkWordInDict(final String word, final String partOfSpeech) {
    final words = state.savedCards[word];
    if (words == null) return false;
    return words.any((w) => w.wordData.partOfSpeech == partOfSpeech);
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
  DictionaryCard? getDueCard(LearningMode mode) {
    return _dictionaryService.getDueCard(mode);
  }

  /// Подсчитывает количество заученных карточек (в состоянии Review)
  int countLearnedCards() {
    return state.savedCards.values
        .expand((cards) => cards)
        .where((card) => card.fsrsCard.state == State.review)
        .length;
  }

  /// Подсчитывает количество карточек в процессе обучения (Learning)
  int countLearningCards() {
    return state.savedCards.values
        .expand((cards) => cards)
        .where((card) => card.fsrsCard.state == State.learning)
        .length;
  }

  /// Подсчитывает количество карточек на переобучении (Relearning)
  int countRelearningCards() {
    return state.savedCards.values
        .expand((cards) => cards)
        .where((card) => card.fsrsCard.state == State.relearning)
        .length;
  }
}

final dictionaryNotifierProvider =
    NotifierProvider<DictionaryNotifier, DictionaryState>(
      DictionaryNotifier.new,
    );

final dictionaryCardsProvider = Provider<Map<String, List<DictionaryCard>>>((
  ref,
) {
  return ref.watch(
    dictionaryNotifierProvider.select((state) => state.savedCards),
  );
});
