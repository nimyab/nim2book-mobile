import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';

class BooksContext with ChangeNotifier {
  final List<Book> _allBooks = [];
  final List<Book> _myBooks = [];
  final _apiClient = GetIt.I.get<ApiClient>();

  List<Book> get allBooks => _allBooks;
  List<Book> get myBooks => _myBooks;

  Future<void> initial() async {
    await getBooks(null, null, 1);
  }

  Future<void> getBooks(String? author, String? title, int page) async {
    try {
      final response = await _apiClient.getBooks(
        author: author,
        title: title,
        page: page.toString(),
      );

      if (page == 1) _allBooks.clear();
      _allBooks.addAll(response.books);
      notifyListeners();
    } finally {
      notifyListeners();
    }
  }
}
