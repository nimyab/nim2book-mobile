import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';

class LoadingBookContext with ChangeNotifier {
  String bookId;
  Book? _book;
  final List<ChapterAlignNode> _chapters = [];
  final _bookService = GetIt.I.get<BookService>();
  bool _isLoading = false;
  double _progress = 0.0;

  Book? get book => _book;
  List<ChapterAlignNode> get chapters => _chapters;
  double get progress => _progress;
  bool get isLoading => _isLoading;

  LoadingBookContext({required this.bookId});

  Future<void> getBookData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final book = await _bookService.getBook(bookId);
      if (book == null) return;
      _book = book;
      notifyListeners();

      final chapterCount = book.chapterPaths.length;
      for (var i = 0; i < chapterCount; i++) {
        final path = book.chapterPaths[i];
        final chapter = await _bookService.getChapter(path);
        if (chapter == null) continue;

        _chapters.add(chapter);
        _progress = (i + 1) / chapterCount;

        notifyListeners();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
