// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Book _$BookFromJson(Map<String, dynamic> json) => _Book(
  id: json['id'] as String,
  title: json['title'] as String,
  originalLang: json['originalLang'] as String,
  translatedLang: json['translatedLang'] as String,
  createdAt: json['createdAt'] as String,
  author: json['author'] == null
      ? null
      : Author.fromJson(json['author'] as Map<String, dynamic>),
  coverUrl: json['coverUrl'] as String?,
  genres: (json['genres'] as List<dynamic>?)
      ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  bookChapters: (json['bookChapters'] as List<dynamic>?)
      ?.map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
      .toList(),
  processStatus: $enumDecodeNullable(
    _$ProcessStatusEnumMap,
    json['processStatus'],
  ),
);

Map<String, dynamic> _$BookToJson(_Book instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'originalLang': instance.originalLang,
  'translatedLang': instance.translatedLang,
  'createdAt': instance.createdAt,
  'author': instance.author,
  'coverUrl': instance.coverUrl,
  'genres': instance.genres,
  'bookChapters': instance.bookChapters,
  'processStatus': _$ProcessStatusEnumMap[instance.processStatus],
};

const _$ProcessStatusEnumMap = {
  ProcessStatus.inProgress: 'in_progress',
  ProcessStatus.completed: 'completed',
  ProcessStatus.failed: 'failed',
};
