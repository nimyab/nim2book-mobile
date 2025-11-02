import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';

class BooksContext with ChangeNotifier {
  final List<Book> _allBooks = [];
  final List<Book> _myBooks = [];
  final _bookService = GetIt.I.get<BookService>();
  bool _isFetchingBooks = false;

  List<Book> get allBooks => _allBooks;
  List<Book> get myBooks => _myBooks;
  bool get isFetchingBooks => _isFetchingBooks;

  Future<void> initial() async {
    getMyBooks();
    await getBooks(null, null, 1);
  }

  Future<void> getBooks(
    final String? author,
    final String? title,
    final int page,
  ) async {
    try {
      _isFetchingBooks = true;
      notifyListeners();
      final books = await _bookService.getBooks(author, title, page.toString());
      if (page == 1) {
        // Не очищаем список, если получили пустой результат (например, ошибка сети),
        // чтобы сохранить ранее загруженные (кэшированные) книги.
        if (books.isNotEmpty) {
          _allBooks.clear();
        }
      }
      if (books.isNotEmpty) {
        _allBooks.addAll(books);
      }
    } finally {
      _isFetchingBooks = false;
      notifyListeners();
    }
  }

  void getMyBooks() {
    try {
      final myBooks = _bookService.getAddedBooks();
      _myBooks.clear();
      _myBooks.addAll(myBooks);
    } finally {
      notifyListeners();
    }
  }

  Future<void> addMyBook(final Book book) async {
    try {
      final isAdded = await _bookService.addBook(book);
      if (isAdded) _myBooks.add(book);
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeMyBook(final Book book) async {
    try {
      final removed = await _bookService.removeBook(book);
      if (removed) {
        _myBooks.removeWhere((final b) => b.id == book.id);
      }
    } finally {
      notifyListeners();
    }
  }
}
