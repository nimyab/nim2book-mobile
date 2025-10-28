import 'dart:convert';
import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _addedBooksKey = 'added_books';
String _chapterKey(String path) => 'book_chapter_$path';

class BookService {
  final _logger = Logger();
  final _apiClient = GetIt.I.get<ApiClient>();
  final _sharedPreferences = GetIt.I.get<SharedPreferences>();

  Future<Book?> getBook(String bookId) async {
    try {
      final response = await _apiClient.getBook(bookId);
      return response.book;
    } catch (e) {
      _logger.e('Error fetching book with ID $bookId: $e');
    }
    return null;
  }

  Future<List<Book>> getBooks(
    String? author,
    String? title,
    String page,
  ) async {
    try {
      final response = await _apiClient.getBooks(
        author: author,
        title: title,
        page: page,
      );
      return response.books;
    } catch (e) {
      _logger.e('Error fetching books: $e');
    }
    return [];
  }

  List<Book> getAddedBooks() {
    final addedBooksJsonList = _sharedPreferences.getStringList(_addedBooksKey);
    if (addedBooksJsonList == null) {
      return [];
    }
    return addedBooksJsonList
        .map((json) => Book.fromJson(jsonDecode(json)))
        .toList();
  }

  Future<bool> addBook(Book book) async {
    final addedBooks = getAddedBooks();
    if (addedBooks.any((b) => b.id == book.id)) {
      return false;
    }
    addedBooks.add(book);
    final addedBooksJsonList = addedBooks
        .map((b) => jsonEncode(b.toJson()))
        .toList();
    return await _sharedPreferences.setStringList(
      _addedBooksKey,
      addedBooksJsonList,
    );
  }

  Future<bool> removeBook(Book book) async {
    final addedBooks = getAddedBooks();
    final filtered = addedBooks.where((b) => b.id != book.id).toList();
    final addedBooksJsonList = filtered
        .map((b) => jsonEncode(b.toJson()))
        .toList();
    return await _sharedPreferences.setStringList(
      _addedBooksKey,
      addedBooksJsonList,
    );
  }

  Future<ChapterAlignNode?> getChapter(String path) async {
    try {
      final chapterKey = _chapterKey(path);

      final cachedChapter = _sharedPreferences.getString(chapterKey);
      if (cachedChapter != null) {
        return ChapterAlignNode.fromJson(
          jsonDecode(_decompressString(cachedChapter)),
        );
      }

      final chapter = await _apiClient.getChapter(path);

      final isAdded = await _sharedPreferences.setString(
        chapterKey,
        _compressString(jsonEncode(chapter.toJson())),
      );
      if (!isAdded) {
        _logger.w('Failed to cache chapter at path $path');
      }

      return chapter;
    } catch (e) {
      _logger.e('Error fetching chapter at path $path: $e');
    }
    return null;
  }

  /// Compresses a string using GZip and returns a Base64 encoded string
  String _compressString(String input) {
    final bytes = utf8.encode(input);
    final compressed = gzip.encode(bytes);
    return base64Encode(compressed);
  }

  /// Decompresses a Base64 encoded GZip string
  String _decompressString(String compressed) {
    final bytes = base64Decode(compressed);
    final decompressed = gzip.decode(bytes);
    return utf8.decode(decompressed);
  }
}
