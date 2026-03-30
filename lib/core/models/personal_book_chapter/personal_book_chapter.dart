import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_book_chapter.freezed.dart';
part 'personal_book_chapter.g.dart';

@freezed
sealed class PersonalBookChapter with _$PersonalBookChapter {
  const factory PersonalBookChapter({
    required String id,
    required int order,
    required String title,
    required String translatedTitle,
    required String contentUrl,
    required String createdAt,
  }) = _PersonalBookChapter;

  factory PersonalBookChapter.fromJson(Map<String, dynamic> json) =>
      _$PersonalBookChapterFromJson(json);
}
