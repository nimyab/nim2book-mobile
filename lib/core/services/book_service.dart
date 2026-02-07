import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';

const String _addedBooksKey = 'added_books';
String _chapterKey(final String path) => 'book_chapter_$path';

// Top-level functions for compute isolates
Map<String, dynamic> _decompressAndDecodeChapter(String compressed) {
  final bytes = base64Decode(compressed);
  final decompressed = gzip.decode(bytes);
  final json = utf8.decode(decompressed);
  return jsonDecode(json) as Map<String, dynamic>;
}

String _encodeAndCompressChapter(Map<String, dynamic> chapterJson) {
  final json = jsonEncode(chapterJson);
  final bytes = utf8.encode(json);
  final compressed = gzip.encode(bytes);
  return base64Encode(compressed);
}

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
        // Parse JSON and convert to Book in compute to avoid blocking UI
        cachedBook = await compute((String data) {
          final json = jsonDecode(data) as Map<String, dynamic>;
          return Book.fromJson(json);
        }, raw);
      }
    } catch (_) {}

    try {
      final response = await _apiClient.getBook(bookId);
      final book = response.book;
      // Cache asynchronously without blocking
      compute(
        (Map<String, dynamic> json) => jsonEncode(json),
        book.toJson(),
      ).then((encoded) => _sharedPreferences.setString(cacheKey, encoded));
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
        // Parse and convert to Book objects in compute to avoid blocking UI
        cached = await compute((String data) {
          final jsonList = jsonDecode(data) as List<dynamic>;
          return jsonList
              .map((e) => Book.fromJson(e as Map<String, dynamic>))
              .toList();
        }, raw);
      }
    } catch (_) {}

    try {
      final response = await _apiClient.getBooks(
        author: author,
        title: title,
        page: page,
      );
      final books = response.books;
      // Cache asynchronously without blocking
      compute(
        (List<Map<String, dynamic>> booksList) => jsonEncode(booksList),
        books.map((final b) => b.toJson()).toList(),
      ).then((encoded) => _sharedPreferences.setString(cacheKey, encoded));
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
    // Decode JSON in separate isolate to avoid blocking UI
    return await compute((List<String> jsonList) {
      return jsonList.map((json) => Book.fromJson(jsonDecode(json))).toList();
    }, addedBooksJsonList);
  }

  Future<bool> addBook(final Book book) async {
    final addedBooks = await getAddedBooks();
    if (addedBooks.any((final b) => b.id == book.id)) {
      return false;
    }
    addedBooks.add(book);
    // Encode in compute to avoid blocking UI
    final addedBooksJsonList = await compute(
      (List<Book> books) => books.map((b) => jsonEncode(b.toJson())).toList(),
      addedBooks,
    );
    return await _sharedPreferences.setStringList(
      _addedBooksKey,
      addedBooksJsonList,
    );
  }

  Future<bool> removeBook(final Book book) async {
    final addedBooks = await getAddedBooks();
    final filtered = addedBooks.where((final b) => b.id != book.id).toList();
    // Encode in compute to avoid blocking UI
    final addedBooksJsonList = await compute(
      (List<Book> books) => books.map((b) => jsonEncode(b.toJson())).toList(),
      filtered,
    );
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
        // Decompress and decode in separate isolate to avoid blocking UI
        final chapterJson = await compute(
          _decompressAndDecodeChapter,
          cachedChapter,
        );
        return ChapterAlignNode.fromJson(chapterJson);
      }

      final chapter = await _apiClient.getChapter(path);

      // Compress and encode in separate isolate without blocking
      final compressed = await compute(
        _encodeAndCompressChapter,
        chapter.toJson(),
      );

      final success = await _sharedPreferences.setString(
        chapterKey,
        compressed,
      );
      if (!success) {
        _logger.warning('Failed to cache chapter at path $path');
      }

      return chapter;
    } catch (e) {
      _logger.error('Error fetching chapter at path $path: $e');
    }
    return null;
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
