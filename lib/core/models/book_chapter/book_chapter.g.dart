// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookChapter _$BookChapterFromJson(Map<String, dynamic> json) => _BookChapter(
  id: json['id'] as String,
  order: (json['order'] as num).toInt(),
  title: json['title'] as String,
  translatedTitle: json['translatedTitle'] as String,
  contentURL: json['contentURL'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$BookChapterToJson(_BookChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'title': instance.title,
      'translatedTitle': instance.translatedTitle,
      'contentURL': instance.contentURL,
      'createdAt': instance.createdAt,
    };
