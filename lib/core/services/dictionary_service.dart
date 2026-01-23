import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

String _getWordKey(final String word, final String partOfSpeech) =>
    'dictionary_word_${word}_$partOfSpeech';

const _fromLang = 'en';
const _toLang = 'ru';
const _ui = 'ru';

class DictionaryService {
  final _logger = GetIt.I.get<Talker>();
  final _apiClient = GetIt.I.get<ApiClient>();
  final _sharedPreferences = GetIt.I.get<SharedPreferences>();

  Future<bool> saveWordWithPos(
    final String word,
    final DictionaryWord wordData,
  ) async {
    try {
      final wordJson = jsonEncode(wordData.toJson());
      return _sharedPreferences.setString(
        _getWordKey(word, wordData.partOfSpeech),
        wordJson,
      );
    } catch (e) {
      _logger.error(
        'Error saving word $word with pos ${wordData.partOfSpeech}: $e',
      );
      return false;
    }
  }

  Future<bool> deleteWordWithPos(
    final String word,
    final String partOfSpeech,
  ) async {
    try {
      return _sharedPreferences.remove(_getWordKey(word, partOfSpeech));
    } catch (e) {
      _logger.error('Error deleting word $word with pos $partOfSpeech: $e');
      return false;
    }
  }

  DictionaryWord? _getSingleWordFromSharedPreferences(final String key) {
    try {
      final wordJson = _sharedPreferences.getString(key);
      if (wordJson == null) return null;
      return DictionaryWord.fromJson(jsonDecode(wordJson));
    } catch (e) {
      _logger.error('Error retrieving single word $key: $e');
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

  bool checkWordWithPosInDict(final String word, final String partOfSpeech) {
    final key = _getWordKey(word, partOfSpeech);
    return _sharedPreferences.containsKey(key);
  }

  Map<String, List<DictionaryWord>> getAllSavedWords() {
    try {
      final keys = _sharedPreferences.getKeys();
      final allWords = <String, List<DictionaryWord>>{};

      for (var key in keys) {
        if (key.startsWith('dictionary_word_')) {
          final singleWord = _getSingleWordFromSharedPreferences(key);
          if (singleWord != null) {
            final word = singleWord.text;
            if (!allWords.containsKey(word)) {
              allWords[word] = [];
            }
            // Check if this word+pos combination already exists
            final exists = allWords[word]!.any(
              (w) => w.partOfSpeech == singleWord.partOfSpeech,
            );
            if (!exists) {
              allWords[word]!.add(singleWord);
            }
          }
        }
      }

      return allWords;
    } catch (e) {
      _logger.error('Error retrieving all words: $e');
      return {};
    }
  }
}
