import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/services/book_service.dart';

class BooksContext with ChangeNotifier {
  final List<Book> _allBooks = [];
  final List<Book> _myBooks = [];
  final _bookService = GetIt.I.get<BookService>();

  List<Book> get allBooks => _allBooks;
  List<Book> get myBooks => _myBooks;

  Future<void> initial() async {
    getMyBooks();
    getBooks(null, null, 1);
  }

  Future<void> getBooks(String? author, String? title, int page) async {
    try {
      final books = await _bookService.getBooks(author, title, page.toString());
      if (page == 1) _allBooks.clear();
      _allBooks.addAll(books);
    } finally {
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

  Future<void> addMyBook(Book book) async {
    try {
      final isAdded = await _bookService.addBook(book);
      if (isAdded) _myBooks.add(book);
    } finally {
      notifyListeners();
    }
  }
}
