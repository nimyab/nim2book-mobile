import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_user_book/personal_user_book.dart';
import 'package:nim2book_mobile_flutter/core/providers/book/books_state.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';

class BooksNotifier extends Notifier<BooksState> {
  late final BookService _bookService;
  late final ApiClient _apiClient;

  @override
  BooksState build() {
    _bookService = ref.read(bookServiceProvider);
    _apiClient = ref.read(apiClientProvider);
    return const BooksState();
  }

  Future<void> initialize() async {
    state = state.copyWith(isFetching: true, errorMessage: null);

    try {
      await getMyBooks();
      await getPersonalBooks();
      await getBooks(null, null, 1);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isFetching: false);
    }
  }

  Future<void> getBooks(
    final String? author,
    final String? title,
    final int page,
  ) async {
    if (page == 1) {
      state = state.copyWith(allBooks: [], isFetching: true, errorMessage: null);
    }
    try {
      final books = await _bookService.getBooks(author, title, page);
      if (books.isNotEmpty) {
        final updated = List<Book>.from(state.allBooks)..addAll(books);
        state = state.copyWith(allBooks: updated);
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      if (page == 1) {
        state = state.copyWith(isFetching: false);
      }
    }
  }

  Future<void> searchBooks(final String query) async {
    try {
      state = state.copyWith(isFetching: true, errorMessage: null);

      final q = query.trim();
      if (q.isEmpty) {
        final books = await _bookService.getBooks(null, null, 1);
        state = state.copyWith(allBooks: books);
        return;
      }

      final byTitle = await _bookService.getBooks(null, q, 1);
      final byAuthor = await _bookService.getBooks(q, null, 1);

      final map = <String, Book>{};
      for (final b in byTitle) {
        map[b.id] = b;
      }
      for (final b in byAuthor) {
        map[b.id] = b;
      }

      state = state.copyWith(allBooks: map.values.toList());
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isFetching: false);
    }
  }

  Future<void> getMyBooks() async {
    try {
      final savedBooks = await _bookService.getAddedBooks();
      state = state.copyWith(savedBooks: savedBooks);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> addMyBook(final Book book) async {
    // Update UI immediately, persist in background
    final updated = List<Book>.from(state.savedBooks)..add(book);
    state = state.copyWith(savedBooks: updated);

    // Persist without blocking UI
    try {
      await _bookService.addBook(book);
    } catch (e) {
      // Revert on error? Or just set error message?
      // Reverting is better for consistency but complex.
      // For now, let's just set errorMessage.
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> removeMyBook(final Book book) async {
    // Update UI immediately, persist in background
    final updated = List<Book>.from(state.savedBooks)
      ..removeWhere((final b) => b.id == book.id);
    state = state.copyWith(savedBooks: updated);

    // Persist without blocking UI
    try {
      await _bookService.removeBook(book);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> getPersonalBooks() async {
    try {
      final response = await _apiClient.getPersonalUserBooks(page: 1);
      state = state.copyWith(personalBooks: response.books);
    } catch (e) {
      state = state.copyWith(personalBooks: [], errorMessage: e.toString());
    }
  }
}

final booksNotifierProvider = NotifierProvider<BooksNotifier, BooksState>(
  BooksNotifier.new,
);

final savedBooksProvider = Provider<List<Book>>((final ref) {
  return ref.watch(booksNotifierProvider.select((s) => s.savedBooks));
});

final personalBooksProvider = Provider<List<PersonalUserBook>>((final ref) {
  return ref.watch(booksNotifierProvider.select((s) => s.personalBooks));
});

final allBooksProvider = Provider<List<Book>>((final ref) {
  return ref.watch(booksNotifierProvider.select((s) => s.allBooks));
});

final isBooksFetchingProvider = Provider<bool>((final ref) {
  return ref.watch(booksNotifierProvider.select((s) => s.isFetching));
});
