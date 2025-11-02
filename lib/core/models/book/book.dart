import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
abstract class Book with _$Book {
  const factory Book({
    required final String id,
    required final String title,
    required final String author,
    required final List<String> chapterPaths,
    required final String? cover,
  }) = _Book;

  factory Book.fromJson(final Map<String, dynamic> json) =>
      _$BookFromJson(json);
}
