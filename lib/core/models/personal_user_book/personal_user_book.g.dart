// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_user_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PersonalUserBook _$PersonalUserBookFromJson(Map<String, dynamic> json) =>
    _PersonalUserBook(
      id: json['id'] as String,
      title: json['title'] as String,
      originalLang: json['originalLang'] as String,
      translatedLang: json['translatedLang'] as String,
      createdAt: json['createdAt'] as String,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      coverUrl: json['coverUrl'] as String?,
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalBookChapters: (json['personalBookChapters'] as List<dynamic>?)
          ?.map((e) => PersonalBookChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      processStatus: $enumDecodeNullable(
        _$ProcessStatusEnumMap,
        json['processStatus'],
      ),
    );

Map<String, dynamic> _$PersonalUserBookToJson(_PersonalUserBook instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalLang': instance.originalLang,
      'translatedLang': instance.translatedLang,
      'createdAt': instance.createdAt,
      'author': instance.author,
      'user': instance.user,
      'coverUrl': instance.coverUrl,
      'genres': instance.genres,
      'personalBookChapters': instance.personalBookChapters,
      'processStatus': _$ProcessStatusEnumMap[instance.processStatus],
    };

const _$ProcessStatusEnumMap = {
  ProcessStatus.inProgress: 'in_progress',
  ProcessStatus.completed: 'completed',
  ProcessStatus.failed: 'failed',
};
