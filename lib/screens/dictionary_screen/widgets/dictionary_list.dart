import 'package:flutter/material.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/screens/dictionary_screen/widgets/dictionary_list_item.dart';

class DictionaryList extends StatelessWidget {
  final Map<String, List<DictionaryWord>> savedWords;

  const DictionaryList({super.key, required this.savedWords});

  @override
  Widget build(BuildContext context) {
    final flattenedWords = _flattenWords();

    return ListView.builder(
      itemCount: flattenedWords.length,
      itemBuilder: (context, index) {
        final entry = flattenedWords[index];
        return DictionaryListItem(word: entry.word, wordData: entry.wordData);
      },
    );
  }

  List<_WordEntry> _flattenWords() {
    final entries = <_WordEntry>[];

    for (final entry in savedWords.entries) {
      for (final wordData in entry.value) {
        entries.add(_WordEntry(word: entry.key, wordData: wordData));
      }
    }

    return entries;
  }
}

class _WordEntry {
  final String word;
  final DictionaryWord wordData;

  _WordEntry({required this.word, required this.wordData});
}
