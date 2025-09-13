import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingBookContext with ChangeNotifier {
  String bookId;
  Book? _book;
  final List<ChapterAlignNode> _chapters = [];
  final _apiClient = GetIt.I.get<ApiClient>();
  bool _isLoading = false;
  double _progress = 0.0;
  final _asyncPreferences = GetIt.I.get<SharedPreferencesAsync>();

  Book? get book => _book;
  List<ChapterAlignNode> get chapters => _chapters;
  double get progress => _progress;
  bool get isLoading => _isLoading;

  LoadingBookContext({required this.bookId});

  Future<void> getBookData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final responseBook = await _apiClient.getBook(bookId);
      _book = responseBook.book;
      notifyListeners();

      final chapterCount = responseBook.book.chapterPaths.length;
      for (var i = 0; i < chapterCount; i++) {
        final cachedContent = await _asyncPreferences.getString(
          'book_chapter_${bookId}_$i',
        );
        if (cachedContent != null) {
          final chapter = ChapterAlignNode.fromJson(
            jsonDecode(cachedContent) as Map<String, dynamic>,
          );
          _chapters.add(chapter);
          _progress = (i + 1) / chapterCount;
          notifyListeners();
          continue;
        }

        final path = responseBook.book.chapterPaths[i];
        final chapter = await _apiClient.getChapter(path);
        _chapters.add(chapter);
        _progress = (i + 1) / chapterCount;

        _asyncPreferences.setString(
          'book_chapter_${bookId}_$i',
          jsonEncode(chapter.toJson()),
        );
        notifyListeners();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
