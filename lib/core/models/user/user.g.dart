// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoogleAccount _$GoogleAccountFromJson(Map<String, dynamic> json) =>
    _GoogleAccount(
      id: json['id'] as String,
      sub: json['sub'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      emailVerified: json['emailVerified'] as bool,
      createdAt: json['createdAt'] as String,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$GoogleAccountToJson(_GoogleAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sub': instance.sub,
      'email': instance.email,
      'name': instance.name,
      'emailVerified': instance.emailVerified,
      'createdAt': instance.createdAt,
      'picture': instance.picture,
    };

_BasicAccount _$BasicAccountFromJson(Map<String, dynamic> json) =>
    _BasicAccount(
      id: json['id'] as String,
      email: json['email'] as String,
      isVerified: json['isVerified'] as bool,
      createdAt: json['createdAt'] as String,
      verifyLink: json['verifyLink'] as String?,
    );

Map<String, dynamic> _$BasicAccountToJson(_BasicAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
      'verifyLink': instance.verifyLink,
    };

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  isAdmin: json['isAdmin'] as bool,
  isVIP: json['isVIP'] as bool,
  createdAt: json['createdAt'] as String,
  googleAccount: json['googleAccount'] == null
      ? null
      : GoogleAccount.fromJson(json['googleAccount'] as Map<String, dynamic>),
  basicAccount: json['basicAccount'] == null
      ? null
      : BasicAccount.fromJson(json['basicAccount'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
  personalBooks: (json['personalBooks'] as List<dynamic>?)
      ?.map((e) => PersonalUserBook.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'isAdmin': instance.isAdmin,
  'isVIP': instance.isVIP,
  'createdAt': instance.createdAt,
  'googleAccount': instance.googleAccount,
  'basicAccount': instance.basicAccount,
  'metadata': instance.metadata,
  'personalBooks': instance.personalBooks,
};
