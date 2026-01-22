// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoogleAccount _$GoogleAccountFromJson(Map<String, dynamic> json) =>
    _GoogleAccount(
      sub: json['sub'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      emailVerified: json['emailVerified'] as bool,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$GoogleAccountToJson(_GoogleAccount instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'email': instance.email,
      'name': instance.name,
      'emailVerified': instance.emailVerified,
      'picture': instance.picture,
    };

_EmailPasswordAccount _$EmailPasswordAccountFromJson(
  Map<String, dynamic> json,
) => _EmailPasswordAccount(
  id: json['id'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$EmailPasswordAccountToJson(
  _EmailPasswordAccount instance,
) => <String, dynamic>{'id': instance.id, 'email': instance.email};

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

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  isAdmin: json['isAdmin'] as bool,
  isVIP: json['isVIP'] as bool,
  googleAccount: json['googleAccount'] == null
      ? null
      : GoogleAccount.fromJson(json['googleAccount'] as Map<String, dynamic>),
  emailPasswordAccount: json['emailPasswordAccount'] == null
      ? null
      : EmailPasswordAccount.fromJson(
          json['emailPasswordAccount'] as Map<String, dynamic>,
        ),
  metadata: json['metadata'] as Map<String, dynamic>?,
  personalUserBooks: (json['personalUserBooks'] as List<dynamic>?)
      ?.map((e) => PersonalUserBook.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'isAdmin': instance.isAdmin,
  'isVIP': instance.isVIP,
  'googleAccount': instance.googleAccount,
  'emailPasswordAccount': instance.emailPasswordAccount,
  'metadata': instance.metadata,
  'personalUserBooks': instance.personalUserBooks,
};
