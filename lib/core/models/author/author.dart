import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_user_book/personal_user_book.dart';

part 'author.freezed.dart';
part 'author.g.dart';

@freezed
sealed class Author with _$Author {
  const factory Author({
    required String id,
    required String name,
    required String createdAt,
    List<Book>? books,
    List<PersonalUserBook>? personalBooks,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
