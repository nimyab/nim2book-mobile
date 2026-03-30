import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/genre/genre.dart';
import 'package:nim2book_mobile_flutter/core/models/author/author.dart';
import 'package:nim2book_mobile_flutter/core/models/process_status/process_status.dart';
import 'package:nim2book_mobile_flutter/core/models/book_chapter/book_chapter.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
sealed class Book with _$Book {
  const factory Book({
    required String id,
    required String title,
    required String originalLang,
    required String translatedLang,
    required String createdAt,
    Author? author,
    String? coverUrl,
    List<Genre>? genres,
    List<BookChapter>? bookChapters,
    ProcessStatus? processStatus,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
