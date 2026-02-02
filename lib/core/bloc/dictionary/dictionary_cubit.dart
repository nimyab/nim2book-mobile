import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_state.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary_card/dictionary_card.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final _dictService = GetIt.I.get<DictionaryService>();

  DictionaryCubit() : super(const DictionaryState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    final savedCards = _dictService.getMapDictionaryCard();
    emit(state.copyWith(savedCards: savedCards));
  }

  Future<bool> saveWord(
    final String word,
    final DictionaryWord wordData,
  ) async {
    emit(state.copyWith(isLoading: true));
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
      emit(state.copyWith(savedCards: updated));
    }
    emit(state.copyWith(isLoading: false));
    return dictionaryCard != null;
  }

  Future<bool> deleteWord(final String word, final String partOfSpeech) async {
    emit(state.copyWith(isLoading: true));
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
      emit(state.copyWith(savedCards: updated));
    }
    emit(state.copyWith(isLoading: false));
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
