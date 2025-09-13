import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReadingContext with ChangeNotifier {
  final _asyncPreferences = GetIt.I.get<SharedPreferencesAsync>();
  final List<ChapterAlignNode> _chapters;
  final String _bookId;
  int _currentChapterIndex = 0;

  int _selectedParagraphIndex = -1;
  int _selectedWordIndex = -1;
  int get selectedWordIndex => _selectedWordIndex;
  int get selectedParagraphIndex => _selectedParagraphIndex;

  ChapterAlignNode get currentChapter => _chapters[_currentChapterIndex];
  int get currentChapterIndex => _currentChapterIndex;
  int get totalChapters => _chapters.length;

  ReadingContext({
    required String bookId,
    required List<ChapterAlignNode> chapters,
  }) : _chapters = chapters,
       _bookId = bookId;

  Future<void> initial() async {
    final currentChapterIndex = await _asyncPreferences.getInt(
      'current_chapter_$_bookId',
    );
    if (currentChapterIndex != null) {
      _currentChapterIndex = currentChapterIndex;
    }
    notifyListeners();
  }

  Future<void> goToChapter(int index) async {
    if (index < 0 || index >= _chapters.length) return;
    _currentChapterIndex = index;
    await _asyncPreferences.setInt('current_chapter_$_bookId', index);
    notifyListeners();
  }

  Future<void> goToNextChapter() async {
    if (_currentChapterIndex < _chapters.length - 1) {
      _currentChapterIndex++;
      await _asyncPreferences.setInt(
        'current_chapter_$_bookId',
        _currentChapterIndex,
      );
      notifyListeners();
    }
  }

  Future<void> goToPreviousChapter() async {
    if (_currentChapterIndex > 0) {
      _currentChapterIndex--;
      await _asyncPreferences.setInt(
        'current_chapter_$_bookId',
        _currentChapterIndex,
      );
      notifyListeners();
    }
  }

  void selectWord(int paragraphIndex, int wordIndex) {
    _selectedParagraphIndex = paragraphIndex;
    _selectedWordIndex = wordIndex;
    notifyListeners();
  }
}
