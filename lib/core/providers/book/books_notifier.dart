import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
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

  void initialize() {
    getMyBooks();
    getPersonalBooks();
    getBooks(null, null, 1);
  }

  Future<void> getBooks(
    final String? author,
    final String? title,
    final int page,
  ) async {
    try {
      state = state.copyWith(isFetching: true);
      if (page == 1) {
        state = state.copyWith(allBooks: []);
      }
      final books = await _bookService.getBooks(author, title, page);
      if (books.isNotEmpty) {
        final updated = List<Book>.from(state.allBooks)..addAll(books);
        state = state.copyWith(allBooks: updated);
      }
    } finally {
      state = state.copyWith(isFetching: false);
    }
  }

  Future<void> searchBooks(final String query) async {
    try {
      state = state.copyWith(isFetching: true);
      state = state.copyWith(allBooks: []);

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
    } finally {
      state = state.copyWith(isFetching: false);
    }
  }

  void getMyBooks() {
    final my = _bookService.getAddedBooks();
    state = state.copyWith(myBooks: my);
  }

  Future<void> addMyBook(final Book book) async {
    final ok = await _bookService.addBook(book);
    if (ok) {
      final updated = List<Book>.from(state.myBooks)..add(book);
      state = state.copyWith(myBooks: updated);
    }
  }

  Future<void> removeMyBook(final Book book) async {
    final ok = await _bookService.removeBook(book);
    if (ok) {
      final updated = List<Book>.from(state.myBooks)
        ..removeWhere((final b) => b.id == book.id);
      state = state.copyWith(myBooks: updated);
    }
  }

  Future<void> getPersonalBooks() async {
    try {
      final response = await _apiClient.getPersonalUserBooks(page: 1);
      state = state.copyWith(personalBooks: response.books);
    } catch (e) {
      // Handle error silently or log it
      state = state.copyWith(personalBooks: []);
    }
  }
}

final booksNotifierProvider = NotifierProvider<BooksNotifier, BooksState>(
  BooksNotifier.new,
);
