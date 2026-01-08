import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';

part 'books_state.freezed.dart';

@freezed
abstract class BooksState with _$BooksState {
  const factory BooksState({
    @Default([]) final List<Book> allBooks,
    @Default([]) final List<Book> myBooks,
    @Default(false) final bool isFetching,
  }) = _BooksState;
}
