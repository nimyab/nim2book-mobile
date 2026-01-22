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

  Future<bool> saveWord(final String word, final List<DictionaryWord> words) async {
    emit(state.copyWith(isLoading: true));
    final ok = await _dictService.saveWord(word, words);
    if (ok) {
      final updated = Map<String, List<DictionaryWord>>.from(state.savedWords);
      updated[word] = words;
      emit(state.copyWith(savedWords: updated));
    }
    emit(state.copyWith(isLoading: false));
    return ok;
  }

  Future<bool> deleteWord(final String word) async {
    emit(state.copyWith(isLoading: true));
    final ok = await _dictService.deleteWord(word);
    if (ok) {
      final updated = Map<String, List<DictionaryWord>>.from(state.savedWords);
      updated.remove(word);
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

  bool checkWordInDict(final String word) => state.savedWords[word] != null;
}
