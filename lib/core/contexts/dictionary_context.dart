import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';

class DictionaryContext with ChangeNotifier {
  final _dictService = GetIt.I.get<DictionaryService>();
  final Map<String, List<Definition>> _savedWords = {};
  Map<String, List<Definition>> get savedWords => _savedWords;

  DictionaryContext() {
    _savedWords.addAll(_dictService.getAllSavedWords());
  }

  Future<bool> saveWord(final String word, final List<Definition> def) async {
    final savedSuccess = await _dictService.saveWord(word, def);
    if (savedSuccess) _savedWords[word] = def;
    notifyListeners();
    return savedSuccess;
  }

  Future<bool> deleteWord(final String word) async {
    final deletedSuccess = await _dictService.deleteWord(word);
    if (deletedSuccess) _savedWords.remove(word);
    notifyListeners();
    return deletedSuccess;
  }

  Future<List<Definition>?> getWord(final String word) async {
    var savedWord = _savedWords[word];
    if (savedWord != null) return savedWord;
    savedWord = await _dictService.getWord(word);
    return savedWord;
  }

  bool checkWordInDict(final String word) {
    return _savedWords[word] != null;
  }
}
