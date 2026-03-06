// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Genre _$GenreFromJson(Map<String, dynamic> json) => _Genre(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: json['createdAt'] as String,
  books: (json['books'] as List<dynamic>?)
      ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
      .toList(),
  personalBooks: (json['personalBooks'] as List<dynamic>?)
      ?.map((e) => PersonalUserBook.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GenreToJson(_Genre instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': instance.createdAt,
  'books': instance.books,
  'personalBooks': instance.personalBooks,
};
