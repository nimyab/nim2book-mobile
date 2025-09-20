import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordItem {
  final String wordText;
  final int? paragraphIndex;
  final int? wordIndex;

  WordItem({required this.wordText, this.paragraphIndex, this.wordIndex});
}

class ReadingContext with ChangeNotifier {
  final _sharedPreferences = GetIt.I.get<SharedPreferences>();
  final List<ChapterAlignNode> _chapters;
  late final List<List<List<WordItem>>> _convertedChapters;
  final String _bookId;
  int _currentChapterIndex = 0;

  int _selectedParagraphIndex = -1;
  int _selectedWordIndex = -1;
  int get selectedWordIndex => _selectedWordIndex;
  int get selectedParagraphIndex => _selectedParagraphIndex;

  ChapterAlignNode get currentChapter => _chapters[_currentChapterIndex];
  // массив параграфов, где каждый параграф это массив слов и промежуточных строк
  List<List<WordItem>> get currentConvertedChapter =>
      _convertedChapters[_currentChapterIndex];
  int get currentChapterIndex => _currentChapterIndex;
  int get totalChapters => _chapters.length;

  ReadingContext({
    required String bookId,
    required List<ChapterAlignNode> chapters,
  }) : _chapters = chapters,
       _bookId = bookId {
    final currentChapterIndex = _sharedPreferences.getInt(
      'current_chapter_$_bookId',
    );
    if (currentChapterIndex != null) {
      _currentChapterIndex = currentChapterIndex;
    }

    _convertedChapters = chapters.map((chapter) {
      return _getChapterItems(chapter);
    }).toList();

    notifyListeners();
  }

  List<List<WordItem>> _getChapterItems(ChapterAlignNode chapter) {
    // преобразую каждый оригинальный параграф главы в список слов и промежуточных строк
    // для удобного отображения и выделения слов
    final chapterItems = <List<WordItem>>[];

    for (
      var paragraphIndex = 0;
      paragraphIndex < chapter.content.length;
      paragraphIndex++
    ) {
      final paragraph = chapter.content[paragraphIndex];
      final originalParagraphAsStrings = <WordItem>[];

      // удаляем дубликаты оригинальных слов в параграфе
      List<WordAlignNode> alignWordNodes = [];
      for (var alignWord in paragraph.aw) {
        if (alignWordNodes.where((e) {
          return e.iow.first == alignWord.iow.first &&
              e.iow.last == alignWord.iow.last;
        }).isEmpty) {
          alignWordNodes.add(alignWord);
        }
      }

      var currentPosition = 0;
      for (var wordIndex = 0; wordIndex < alignWordNodes.length; wordIndex++) {
        final wordAlign = alignWordNodes[wordIndex];
        final startIndex = wordAlign.iow.first;
        final endIndex = wordAlign.iow.last;

        if (startIndex > currentPosition) {
          final betweenText = paragraph.op.substring(
            currentPosition,
            startIndex,
          );
          if (betweenText.isNotEmpty) {
            originalParagraphAsStrings.add(WordItem(wordText: betweenText));
          }
        }

        final wordText = paragraph.op.substring(startIndex, endIndex);
        originalParagraphAsStrings.add(
          WordItem(
            wordText: wordText,
            wordIndex: wordIndex,
            paragraphIndex: paragraphIndex,
          ),
        );

        currentPosition = endIndex;
      }

      if (currentPosition < paragraph.op.length) {
        final remainingText = paragraph.op.substring(currentPosition);
        if (remainingText.isNotEmpty) {
          originalParagraphAsStrings.add(WordItem(wordText: remainingText));
        }
      }

      chapterItems.add(originalParagraphAsStrings);
    }

    return chapterItems;
  }

  Future<void> goToChapter(int index) async {
    if (index < 0 || index >= _chapters.length) return;
    _currentChapterIndex = index;
    _sharedPreferences.setInt('current_chapter_$_bookId', index);
    notifyListeners();
  }

  Future<void> goToNextChapter() async {
    if (_currentChapterIndex < _chapters.length - 1) {
      goToChapter(_currentChapterIndex + 1);
      selectWord(-1, -1);
    }
  }

  Future<void> goToPreviousChapter() async {
    if (_currentChapterIndex > 0) {
      goToChapter(_currentChapterIndex - 1);
      selectWord(-1, -1);
    }
  }

  void selectWord(int paragraphIndex, int wordIndex) {
    _selectedParagraphIndex = paragraphIndex;
    _selectedWordIndex = wordIndex;
    notifyListeners();
  }
}
