import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

String _getWordKey(final String word) => 'dictionary_word_$word';

const _fromLang = 'en';
const _toLang = 'ru';
const _ui = 'ru';

class DictionaryService {
  final _logger = GetIt.I.get<Talker>();
  final _apiClient = GetIt.I.get<ApiClient>();
  final _sharedPreferences = GetIt.I.get<SharedPreferences>();

  Future<bool> saveWord(final String word, final List<DictionaryWord> words) async {
    try {
      final wordJson = words
          .map((final w) => jsonEncode(w.toJson()))
          .toList();
      return _sharedPreferences.setStringList(_getWordKey(word), wordJson);
    } catch (e) {
      _logger.error('Error saving word $word: $e');
      return false;
    }
  }

  Future<bool> deleteWord(final String word) async {
    try {
      return _sharedPreferences.remove(_getWordKey(word));
    } catch (e) {
      _logger.error('Error deleting word $word: $e');
      return false;
    }
  }

  List<DictionaryWord>? _getWordFromSharedPreferences(final String key) {
    try {
      final wordJsonList = _sharedPreferences.getStringList(key);
      if (wordJsonList == null) return null;
      return wordJsonList
          .map((final json) => DictionaryWord.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      _logger.error('Error retrieving word $key: $e');
      return null;
    }
  }

  Future<List<DictionaryWord>?> getWord(final String word) async {
    final savedWordInfo = _getWordFromSharedPreferences(_getWordKey(word));
    if (savedWordInfo != null) return savedWordInfo;

    try {
      final response = await _apiClient.lookup(
        LookupRequest(text: word, fromLang: _fromLang, toLang: _toLang, ui: _ui),
      );
      return response.words;
    } catch (e) {
      _logger.error(e);
      return savedWordInfo;
    }
  }

  Map<String, List<DictionaryWord>> getAllSavedWords() {
    try {
      final keys = _sharedPreferences.getKeys();
      final allWords = <String, List<DictionaryWord>>{};

      for (var key in keys) {
        if (key.startsWith('dictionary_word_')) {
          final word = key.substring('dictionary_word_'.length);
          final words = _getWordFromSharedPreferences(key);
          if (words != null) allWords[word] = words;
        }
      }

      return allWords;
    } catch (e) {
      _logger.error('Error retrieving all words: $e');
      return {};
    }
  }
}
