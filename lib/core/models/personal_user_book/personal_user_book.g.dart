// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_user_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalUserBook _$PersonalUserBookFromJson(Map<String, dynamic> json) =>
    _PersonalUserBook(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      chapterPaths: (json['chapterPaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userId: json['userId'] as String,
      cover: json['cover'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PersonalUserBookToJson(_PersonalUserBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'chapterPaths': instance.chapterPaths,
      'userId': instance.userId,
      'cover': instance.cover,
      'genres': instance.genres,
    };
