// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  id: json['id'] as String,
  title: json['title'] as String,
  author: json['author'] as String,
  chapterPaths: (json['chapterPaths'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  cover: json['cover'] as String?,
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'author': instance.author,
  'chapterPaths': instance.chapterPaths,
  'cover': instance.cover,
};
