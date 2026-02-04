import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/dictionary/dictionary_state.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';

class DictionaryNotifier extends Notifier<DictionaryState> {
  late final DictionaryService _dictService;

  @override
  DictionaryState build() {
    _dictService = ref.read(dictionaryServiceProvider);
    final savedCards = _dictService.getMapDictionaryCard();
    return DictionaryState(savedCards: savedCards);
  }

  Future<bool> saveWord(
    final String word,
    final DictionaryWord wordData,
  ) async {
    final dictionaryCard = await _dictService.saveWord(wordData);
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
      state = DictionaryState(savedCards: updated);
    }
    return dictionaryCard != null;
  }

  Future<bool> deleteWord(final String word, final String partOfSpeech) async {
    final ok = await _dictService.deleteWord(word, partOfSpeech);
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
      state = DictionaryState(savedCards: updated);
    }
    return ok;
  }

  Future<List<DictionaryWord>?> getWordLocalFirst(final String word) async {
    final saved = state.savedCards[word];
    if (saved != null) return saved.map((e) => e.wordData).toList();
    return _dictService.getWord(word);
  }

  Future<List<DictionaryWord>?> getWordServiceFirst(final String word) async {
    final wordFromServer = await _dictService.getWord(word);
    if (wordFromServer != null) return wordFromServer;
    return state.savedCards[word]?.map((e) => e.wordData).toList();
  }

  bool checkWordInDict(final String word, final String partOfSpeech) {
    final words = state.savedCards[word];
    if (words == null) return false;
    return words.any((w) => w.wordData.partOfSpeech == partOfSpeech);
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
