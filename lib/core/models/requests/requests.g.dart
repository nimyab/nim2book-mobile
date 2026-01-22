// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) =>
    _LoginRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(_LoginRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_GoogleLoginRequest _$GoogleLoginRequestFromJson(Map<String, dynamic> json) =>
    _GoogleLoginRequest(idToken: json['idToken'] as String);

Map<String, dynamic> _$GoogleLoginRequestToJson(_GoogleLoginRequest instance) =>
    <String, dynamic>{'idToken': instance.idToken};

_RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    _RegisterRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(_RegisterRequest instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

_RefreshRequest _$RefreshRequestFromJson(Map<String, dynamic> json) =>
    _RefreshRequest(refreshToken: json['refreshToken'] as String);

Map<String, dynamic> _$RefreshRequestToJson(_RefreshRequest instance) =>
    <String, dynamic>{'refreshToken': instance.refreshToken};

_AddFcmTokenRequest _$AddFcmTokenRequestFromJson(Map<String, dynamic> json) =>
    _AddFcmTokenRequest(fcmToken: json['fcmToken'] as String);

Map<String, dynamic> _$AddFcmTokenRequestToJson(_AddFcmTokenRequest instance) =>
    <String, dynamic>{'fcmToken': instance.fcmToken};

_LookupRequest _$LookupRequestFromJson(Map<String, dynamic> json) =>
    _LookupRequest(
      text: json['text'] as String,
      fromLang: json['fromLang'] as String,
      toLang: json['toLang'] as String,
      ui: json['ui'] as String,
    );

Map<String, dynamic> _$LookupRequestToJson(_LookupRequest instance) =>
    <String, dynamic>{
      'text': instance.text,
      'fromLang': instance.fromLang,
      'toLang': instance.toLang,
      'ui': instance.ui,
    };

_CreateGenreRequest _$CreateGenreRequestFromJson(Map<String, dynamic> json) =>
    _CreateGenreRequest(name: json['name'] as String);

Map<String, dynamic> _$CreateGenreRequestToJson(_CreateGenreRequest instance) =>
    <String, dynamic>{'name': instance.name};

_UpdateGenreRequest _$UpdateGenreRequestFromJson(Map<String, dynamic> json) =>
    _UpdateGenreRequest(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$UpdateGenreRequestToJson(_UpdateGenreRequest instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_UpdateMetadataRequest _$UpdateMetadataRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateMetadataRequest(metadata: json['metadata'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateMetadataRequestToJson(
  _UpdateMetadataRequest instance,
) => <String, dynamic>{'metadata': instance.metadata};

_NotificationTestRequest _$NotificationTestRequestFromJson(
  Map<String, dynamic> json,
) => _NotificationTestRequest(
  title: json['title'] as String?,
  body: json['body'] as String?,
);

Map<String, dynamic> _$NotificationTestRequestToJson(
  _NotificationTestRequest instance,
) => <String, dynamic>{'title': instance.title, 'body': instance.body};
