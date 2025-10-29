import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/models/word_item.dart';
import 'package:nim2book_mobile_flutter/features/book_reading/services/chapter_converter.dart';
import 'package:shared_preferences/shared_preferences.dart';

String currentChapterKey(String bookId) => 'current_chapter_$bookId';

String chapterProgressKey(String bookId) => 'chapter_progress_$bookId';

class BookReadingContext with ChangeNotifier {
  final _sharedPreferences = GetIt.I.get<SharedPreferences>();

  final List<ChapterAlignNode> _chapters;
  ChapterAlignNode get currentChapter => _chapters[_currentChapterIndex];
  int get totalChapters => _chapters.length;

  // Количество параграфов в текущей главе
  int get currentParagraphCount => currentChapter.content.length;

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

    final savedProgress = _sharedPreferences.getDouble(
      chapterProgressKey(_bookId),
    );
    if (savedProgress != null) _chapterProgress = savedProgress;

    notifyListeners();
  }

  void setChapters(List<ChapterAlignNode> chapters) {
    _chapters
      ..clear()
      ..addAll(chapters);

    if (_chapters.isEmpty) {
      _currentChapterIndex = 0;
    } else if (_currentChapterIndex >= _chapters.length) {
      _currentChapterIndex = _chapters.length - 1;
    }

    notifyListeners();
  }

  // Возвращает список слов для указанного параграфа текущей главы.
  // Каждый вызов создает новые элементы, избегая общей предвычисленной структуры.
  List<WordItem> getParagraphItems(int paragraphIndex) {
    if (paragraphIndex < 0 || paragraphIndex >= currentChapter.content.length) {
      return const [];
    }
    final paragraph = currentChapter.content[paragraphIndex];
    return const ChapterConverter().convertParagraph(paragraph, paragraphIndex);
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
