import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_user_book/personal_user_book.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

@freezed
sealed class Genre with _$Genre {
  const factory Genre({
    required String id,
    required String name,
    required String createdAt,
    List<Book>? books,
    List<PersonalUserBook>? personalBooks,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
