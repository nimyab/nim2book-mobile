// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_book_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalBookChapter _$PersonalBookChapterFromJson(Map<String, dynamic> json) =>
    _PersonalBookChapter(
      id: json['id'] as String,
      order: (json['order'] as num).toInt(),
      title: json['title'] as String,
      translatedTitle: json['translatedTitle'] as String,
      contentUrl: json['contentUrl'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$PersonalBookChapterToJson(
  _PersonalBookChapter instance,
) => <String, dynamic>{
  'id': instance.id,
  'order': instance.order,
  'title': instance.title,
  'translatedTitle': instance.translatedTitle,
  'contentUrl': instance.contentUrl,
  'createdAt': instance.createdAt,
};
