import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_user_book/personal_user_book.dart';

part 'books_state.freezed.dart';

@freezed
sealed class BooksState with _$BooksState {
  const factory BooksState({
    @Default([]) final List<Book> allBooks,
    @Default([]) final List<Book> savedBooks,
    @Default([]) final List<PersonalUserBook> personalBooks,
    @Default(false) final bool isFetching,
  }) = _BooksState;
}
