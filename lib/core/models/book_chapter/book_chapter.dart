import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_chapter.freezed.dart';
part 'book_chapter.g.dart';

@freezed
sealed class BookChapter with _$BookChapter {
  const factory BookChapter({
    required String id,
    required int order,
    required String title,
    required String translatedTitle,
    required String contentURL,
    required String createdAt,
  }) = _BookChapter;

  factory BookChapter.fromJson(Map<String, dynamic> json) =>
      _$BookChapterFromJson(json);
}
