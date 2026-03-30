// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Author _$AuthorFromJson(Map<String, dynamic> json) => _Author(
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

Map<String, dynamic> _$AuthorToJson(_Author instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'createdAt': instance.createdAt,
  'books': instance.books,
  'personalBooks': instance.personalBooks,
};
