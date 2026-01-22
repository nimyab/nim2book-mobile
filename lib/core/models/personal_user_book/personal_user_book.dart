import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/genre/genre.dart';

part 'personal_user_book.freezed.dart';
part 'personal_user_book.g.dart';

@freezed
abstract class PersonalUserBook with _$PersonalUserBook {
  const factory PersonalUserBook({
    required final String id,
    required final String title,
    required final String author,
    required final List<String> chapterPaths,
    required final String userId,
    final String? cover,
    final List<Genre>? genres,
  }) = _PersonalUserBook;

  factory PersonalUserBook.fromJson(final Map<String, dynamic> json) =>
      _$PersonalUserBookFromJson(json);
}
