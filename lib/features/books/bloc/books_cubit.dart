import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';

class BooksState {
  final List<Book> allBooks;
  final List<Book> myBooks;
  final bool isFetching;

  const BooksState({
    this.allBooks = const [],
    this.myBooks = const [],
    this.isFetching = false,
  });

  BooksState copyWith({
    final List<Book>? allBooks,
    final List<Book>? myBooks,
    final bool? isFetching,
  }) {
    return BooksState(
      allBooks: allBooks ?? this.allBooks,
      myBooks: myBooks ?? this.myBooks,
      isFetching: isFetching ?? this.isFetching,
    );
  }
}

class BooksCubit extends Cubit<BooksState> {
  final BookService _bookService = GetIt.I.get<BookService>();

  BooksCubit() : super(const BooksState());

  Future<void> initialize() async {
    getMyBooks();
    await getBooks(null, null, 1);
  }

  Future<void> getBooks(
    final String? author,
    final String? title,
    final int page,
  ) async {
    try {
      emit(state.copyWith(isFetching: true));
      if (page == 1) {
        emit(state.copyWith(allBooks: []));
      }
      final books = await _bookService.getBooks(author, title, page.toString());
      if (books.isNotEmpty) {
        final updated = List<Book>.from(state.allBooks)..addAll(books);
        emit(state.copyWith(allBooks: updated));
      }
    } finally {
      emit(state.copyWith(isFetching: false));
    }
  }

  Future<void> searchBooks(final String query) async {
    try {
      emit(state.copyWith(isFetching: true));
      emit(state.copyWith(allBooks: []));

      final q = query.trim();
      if (q.isEmpty) {
        final books = await _bookService.getBooks(null, null, '1');
        emit(state.copyWith(allBooks: books));
        return;
      }

      final byTitle = await _bookService.getBooks(null, q, '1');
      final byAuthor = await _bookService.getBooks(q, null, '1');

      final map = <String, Book>{};
      for (final b in byTitle) {
        map[b.id] = b;
      }
      for (final b in byAuthor) {
        map[b.id] = b;
      }

      emit(state.copyWith(allBooks: map.values.toList()));
    } finally {
      emit(state.copyWith(isFetching: false));
    }
  }

  void getMyBooks() {
    final my = _bookService.getAddedBooks();
    emit(state.copyWith(myBooks: my));
  }

  Future<void> addMyBook(final Book book) async {
    final ok = await _bookService.addBook(book);
    if (ok) {
      final updated = List<Book>.from(state.myBooks)..add(book);
      emit(state.copyWith(myBooks: updated));
    }
  }

  Future<void> removeMyBook(final Book book) async {
    final ok = await _bookService.removeBook(book);
    if (ok) {
      final updated = List<Book>.from(state.myBooks)
        ..removeWhere((final b) => b.id == book.id);
      emit(state.copyWith(myBooks: updated));
    }
  }
}
