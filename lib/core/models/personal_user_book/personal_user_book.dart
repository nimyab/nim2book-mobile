import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/genre/genre.dart';
import 'package:nim2book_mobile_flutter/core/models/author/author.dart';
import 'package:nim2book_mobile_flutter/core/models/process_status/process_status.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_book_chapter/personal_book_chapter.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';

part 'personal_user_book.freezed.dart';
part 'personal_user_book.g.dart';

@freezed
sealed class PersonalUserBook with _$PersonalUserBook {
  const factory PersonalUserBook({
    required String id,
    required String title,
    required String originalLang,
    required String translatedLang,
    required String createdAt,
    Author? author,
    User? user,
    String? coverUrl,
    List<Genre>? genres,
    List<PersonalBookChapter>? personalBookChapters,
    ProcessStatus? processStatus,
  }) = _PersonalUserBook;

  factory PersonalUserBook.fromJson(Map<String, dynamic> json) =>
      _$PersonalUserBookFromJson(json);
}
