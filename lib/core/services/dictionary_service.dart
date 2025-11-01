import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _getWordKey(String word) => 'dictionary_word_$word';

const _lang = 'en-ru';
const _ui = 'ru';

class DictionaryService {
  final _logger = Logger();
  final _apiClient = GetIt.I.get<ApiClient>();
  final _sharedPreferences = GetIt.I.get<SharedPreferences>();

  Future<bool> saveWord(String word, List<Definition> defs) async {
    try {
      final wordJson = defs.map((def) => jsonEncode(def.toJson())).toList();
      return _sharedPreferences.setStringList(_getWordKey(word), wordJson);
    } catch (e) {
      _logger.e('Error saving word $word: $e');
      return false;
    }
  }

  Future<bool> deleteWord(String word) async {
    try {
      return _sharedPreferences.remove(_getWordKey(word));
    } catch (e) {
      _logger.e(e);
      return false;
    }
  }

  List<Definition>? _getWordFromSharedPreferences(String key) {
    try {
      final wordJsonList = _sharedPreferences.getStringList(key);
      if (wordJsonList == null) return null;
      return wordJsonList
          .map((json) => Definition.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      _logger.e('Error retrieving word $key: $e');
      return null;
    }
  }

  Future<List<Definition>?> getWord(String word) async {
    final savedWordInfo = _getWordFromSharedPreferences(_getWordKey(word));
    if (savedWordInfo != null) return savedWordInfo;

    try {
      final response = await _apiClient.lookup(
        LookupRequest(text: word, lang: _lang, ui: _ui),
      );
      return response.def;
    } catch (e) {
      _logger.e(e);
      return savedWordInfo;
    }
  }

  Map<String, List<Definition>> getAllSavedWords() {
    try {
      final keys = _sharedPreferences.getKeys();
      final Map<String, List<Definition>> allWords = {};

      for (var key in keys) {
        if (key.startsWith('dictionary_word_')) {
          final word = key.substring('dictionary_word_'.length);
          final defs = _getWordFromSharedPreferences(key);
          if (defs != null) allWords[word] = defs;
        }
      }

      return allWords;
    } catch (e) {
      _logger.e('Error retrieving all words: $e');
      return {};
    }
  }
}
