import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

const String _addedBooksKey = 'added_books';
String _chapterKey(final String path) => 'book_chapter_$path';

class BookService {
  final Talker _logger;
  final ApiClient _apiClient;
  final SharedPreferences _sharedPreferences;

  BookService(this._logger, this._apiClient, this._sharedPreferences);

  Future<Book?> getBook(final String bookId) async {
    final cacheKey = 'book_$bookId';

    Book? cachedBook;
    try {
      final raw = _sharedPreferences.getString(cacheKey);
      if (raw != null) {
        cachedBook = await Future.microtask(
          () => Book.fromJson(jsonDecode(raw)),
        );
      }
    } catch (_) {}

    try {
      final response = await _apiClient.getBook(bookId);
      final book = response.book;
      await _sharedPreferences.setString(cacheKey, jsonEncode(book.toJson()));
      return book;
    } catch (e) {
      _logger.error('Error fetching book with ID $bookId: $e');
      return cachedBook;
    }
  }

  Future<List<Book>> getBooks(
    final String? author,
    final String? title,
    final int page,
  ) async {
    final cacheKey = 'books_list_${author ?? ''}_${title ?? ''}_$page';

    var cached = <Book>[];
    try {
      final raw = _sharedPreferences.getString(cacheKey);
      if (raw != null) {
        cached = await Future.microtask(() {
          final list = jsonDecode(raw) as List<dynamic>;
          return list
              .map((final e) => Book.fromJson(e as Map<String, dynamic>))
              .toList();
        });
      }
    } catch (_) {}

    try {
      final response = await _apiClient.getBooks(
        author: author,
        title: title,
        page: page,
      );
      final books = response.books;
      await _sharedPreferences.setString(
        cacheKey,
        jsonEncode(books.map((final b) => b.toJson()).toList()),
      );
      return books;
    } catch (e) {
      _logger.error('Error fetching books: $e');
      return cached;
    }
  }

  Future<List<Book>> getAddedBooks() async {
    final addedBooksJsonList = _sharedPreferences.getStringList(_addedBooksKey);
    if (addedBooksJsonList == null) {
      return [];
    }
    return Future.microtask(() {
      return addedBooksJsonList
          .map((final json) => Book.fromJson(jsonDecode(json)))
          .toList();
    });
  }

  Future<bool> addBook(final Book book) async {
    final addedBooks = await getAddedBooks();
    if (addedBooks.any((final b) => b.id == book.id)) {
      return false;
    }
    addedBooks.add(book);
    final addedBooksJsonList = addedBooks
        .map((final b) => jsonEncode(b.toJson()))
        .toList();
    return await _sharedPreferences.setStringList(
      _addedBooksKey,
      addedBooksJsonList,
    );
  }

  Future<bool> removeBook(final Book book) async {
    final addedBooks = await getAddedBooks();
    final filtered = addedBooks.where((final b) => b.id != book.id).toList();
    final addedBooksJsonList = filtered
        .map((final b) => jsonEncode(b.toJson()))
        .toList();
    final updated = await _sharedPreferences.setStringList(
      _addedBooksKey,
      addedBooksJsonList,
    );
    if (updated) {
      unawaited(_cleanupBookCache(book));
    }
    return updated;
  }

  Future<ChapterAlignNode?> getChapter(final String path) async {
    try {
      final chapterKey = _chapterKey(path);

      final cachedChapter = _sharedPreferences.getString(chapterKey);
      if (cachedChapter != null) {
        // Decompress and decode off the main thread
        return Future.microtask(() {
          return ChapterAlignNode.fromJson(
            jsonDecode(_decompressString(cachedChapter)),
          );
        });
      }

      final chapter = await _apiClient.getChapter(path);

      // Compress and encode off the main thread
      final compressed = await Future.microtask(() {
        return _compressString(jsonEncode(chapter.toJson()));
      });

      final isAdded = await _sharedPreferences.setString(
        chapterKey,
        compressed,
      );
      if (!isAdded) {
        _logger.warning('Failed to cache chapter at path $path');
      }

      return chapter;
    } catch (e) {
      _logger.error('Error fetching chapter at path $path: $e');
    }
    return null;
  }

  /// Сжимает строку с помощью GZip и возвращает Base64-представление
  String _compressString(final String input) {
    final bytes = utf8.encode(input);
    final compressed = gzip.encode(bytes);
    return base64Encode(compressed);
  }

  /// Декодирует Base64 и распаковывает GZip-строку
  String _decompressString(final String compressed) {
    final bytes = base64Decode(compressed);
    final decompressed = gzip.decode(bytes);
    return utf8.decode(decompressed);
  }

  Future<void> _cleanupBookCache(final Book book) async {
    try {
      for (final path in book.chapterPaths) {
        final key = _chapterKey(path);
        final removed = await _sharedPreferences.remove(key);
        if (!removed) {
          _logger.warning('Failed to remove cached chapter for path $path');
        }
      }

      await _sharedPreferences.remove('current_chapter_${book.id}');
      await _sharedPreferences.remove('chapter_progress_${book.id}');
      await _sharedPreferences.remove('reading_current_chapter_${book.id}');
      await _sharedPreferences.remove('reading_progress_${book.id}');
    } catch (e) {
      _logger.warning('Cleanup error for book ${book.id}: $e');
    }
  }
}
