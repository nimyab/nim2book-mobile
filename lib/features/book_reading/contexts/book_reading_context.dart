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

String currentChapterKey(String bookId) => 'current_chapter_$bookId';

String chapterProgressKey(String bookId) => 'chapter_progress_$bookId';

class BookReadingContext with ChangeNotifier {
  final _sharedPreferences = GetIt.I.get<SharedPreferences>();

  final List<ChapterAlignNode> _chapters;
  ChapterAlignNode get currentChapter => _chapters[_currentChapterIndex];
  int get totalChapters => _chapters.length;

  // список глав, нужно для удобного отображения оригинального текста
  // массив параграфов, где каждый параграф это массив слов и промежуточных строк
  late final List<List<List<WordItem>>> _convertedChapters;
  List<List<WordItem>> get currentConvertedChapter =>
      _convertedChapters[_currentChapterIndex];

  final String _bookId;

  int _currentChapterIndex = 0;
  int get currentChapterIndex => _currentChapterIndex;

  int _selectedParagraphIndex = -1;
  int get selectedParagraphIndex => _selectedParagraphIndex;

  int _selectedWordIndex = -1;
  int get selectedWordIndex => _selectedWordIndex;

  double _chapterProgress = 0.0;
  double get chapterProgress => _chapterProgress;

  BookReadingContext({
    required String bookId,
    required List<ChapterAlignNode> chapters,
  }) : _chapters = chapters,
       _bookId = bookId {
    final currentChapterIndex = _sharedPreferences.getInt(
      currentChapterKey(_bookId),
    );
    if (currentChapterIndex != null) _currentChapterIndex = currentChapterIndex;

    _convertedChapters = chapters.map((chapter) {
      return _getChapterItems(chapter);
    }).toList();

    final savedProgress = _sharedPreferences.getDouble(
      chapterProgressKey(_bookId),
    );
    if (savedProgress != null) _chapterProgress = savedProgress;

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
        if (!alignWordNodes.any((e) {
          return e.iow.first == alignWord.iow.first &&
              e.iow.last == alignWord.iow.last;
        })) {
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

  void goToChapter(int index) {
    if (index < 0 || index >= _chapters.length) return;

    _currentChapterIndex = index;
    _sharedPreferences.setInt(currentChapterKey(_bookId), index);
    // при смене главы сбрасываю прогресс прокрутки и выделение слова
    setChapterProgress(0.0);
    selectWord(-1, -1);

    notifyListeners();
  }

  void goToNextChapter() {
    if (_currentChapterIndex < _chapters.length - 1) {
      goToChapter(_currentChapterIndex + 1);
    }
  }

  void goToPreviousChapter() {
    if (_currentChapterIndex > 0) {
      goToChapter(_currentChapterIndex - 1);
    }
  }

  void selectWord(int paragraphIndex, int wordIndex) {
    _selectedParagraphIndex = paragraphIndex;
    _selectedWordIndex = wordIndex;
    notifyListeners();
  }

  void setChapterProgress(double progress) {
    _chapterProgress = progress;
    _sharedPreferences.setDouble(chapterProgressKey(_bookId), progress);
  }
}
