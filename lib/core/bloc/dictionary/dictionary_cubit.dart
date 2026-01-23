import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/bloc/dictionary/dictionary_state.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final DictionaryService _dictService = GetIt.I.get<DictionaryService>();

  DictionaryCubit() : super(const DictionaryState()) {
    emit(state.copyWith(savedWords: _dictService.getAllSavedWords()));
  }

  Future<bool> saveWordWithPos(
    final String word,
    final DictionaryWord wordData,
  ) async {
    emit(state.copyWith(isLoading: true));
    final ok = await _dictService.saveWordWithPos(word, wordData);
    if (ok) {
      final updated = Map<String, List<DictionaryWord>>.from(state.savedWords);
      if (!updated.containsKey(word)) {
        updated[word] = [];
      }
      // Remove existing word with same partOfSpeech if any
      updated[word]!.removeWhere(
        (w) => w.partOfSpeech == wordData.partOfSpeech,
      );
      // Add new word
      updated[word]!.add(wordData);
      emit(state.copyWith(savedWords: updated));
    }
    emit(state.copyWith(isLoading: false));
    return ok;
  }

  Future<bool> deleteWordWithPos(
    final String word,
    final String partOfSpeech,
  ) async {
    emit(state.copyWith(isLoading: true));
    final ok = await _dictService.deleteWordWithPos(word, partOfSpeech);
    if (ok) {
      final updated = Map<String, List<DictionaryWord>>.from(state.savedWords);
      if (updated.containsKey(word)) {
        updated[word]!.removeWhere((w) => w.partOfSpeech == partOfSpeech);
        if (updated[word]!.isEmpty) {
          updated.remove(word);
        }
      }
      emit(state.copyWith(savedWords: updated));
    }
    emit(state.copyWith(isLoading: false));
    return ok;
  }

  Future<List<DictionaryWord>?> getWord(final String word) async {
    final saved = state.savedWords[word];
    if (saved != null) return saved;
    return _dictService.getWord(word);
  }

  Future<List<DictionaryWord>?> getWordFromServer(final String word) async {
    final wordFromServer = await _dictService.getWord(word);
    if (wordFromServer != null) return wordFromServer;

    final saved = state.savedWords[word];
    if (saved != null) return saved;

    return null;
  }

  bool checkWordWithPosInDict(final String word, final String? partOfSpeech) {
    final words = state.savedWords[word];
    if (words == null) return false;
    return words.any((w) => w.partOfSpeech == partOfSpeech);
  }
}
