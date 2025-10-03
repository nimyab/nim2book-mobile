// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

_GoogleLoginResponse _$GoogleLoginResponseFromJson(Map<String, dynamic> json) =>
    _GoogleLoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GoogleLoginResponseToJson(
  _GoogleLoginResponse instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'user': instance.user,
};

_RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    _RegisterResponse(success: json['success'] as bool);

Map<String, dynamic> _$RegisterResponseToJson(_RegisterResponse instance) =>
    <String, dynamic>{'success': instance.success};

_RefreshResponse _$RefreshResponseFromJson(Map<String, dynamic> json) =>
    _RefreshResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshResponseToJson(_RefreshResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    _LogoutResponse(success: json['success'] as bool);

Map<String, dynamic> _$LogoutResponseToJson(_LogoutResponse instance) =>
    <String, dynamic>{'success': instance.success};

_MeResponse _$MeResponseFromJson(Map<String, dynamic> json) =>
    _MeResponse(user: User.fromJson(json['user'] as Map<String, dynamic>));

Map<String, dynamic> _$MeResponseToJson(_MeResponse instance) =>
    <String, dynamic>{'user': instance.user};

_GetBooksResponse _$GetBooksResponseFromJson(Map<String, dynamic> json) =>
    _GetBooksResponse(
      books: (json['books'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBooksResponseToJson(_GetBooksResponse instance) =>
    <String, dynamic>{'books': instance.books};

_GetBookResponse _$GetBookResponseFromJson(Map<String, dynamic> json) =>
    _GetBookResponse(book: Book.fromJson(json['book'] as Map<String, dynamic>));

Map<String, dynamic> _$GetBookResponseToJson(_GetBookResponse instance) =>
    <String, dynamic>{'book': instance.book};

_TranslateBookResponse _$TranslateBookResponseFromJson(
  Map<String, dynamic> json,
) => _TranslateBookResponse(
  book: Book.fromJson(json['book'] as Map<String, dynamic>),
  messageAboutTranslate: json['messageAboutTranslate'] as String,
);

Map<String, dynamic> _$TranslateBookResponseToJson(
  _TranslateBookResponse instance,
) => <String, dynamic>{
  'book': instance.book,
  'messageAboutTranslate': instance.messageAboutTranslate,
};

_UpdateBookResponse _$UpdateBookResponseFromJson(Map<String, dynamic> json) =>
    _UpdateBookResponse(
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateBookResponseToJson(_UpdateBookResponse instance) =>
    <String, dynamic>{'book': instance.book};

_AddFcmTokenResponse _$AddFcmTokenResponseFromJson(Map<String, dynamic> json) =>
    _AddFcmTokenResponse(success: json['success'] as bool);

Map<String, dynamic> _$AddFcmTokenResponseToJson(
  _AddFcmTokenResponse instance,
) => <String, dynamic>{'success': instance.success};

_DeleteFcmTokenResponse _$DeleteFcmTokenResponseFromJson(
  Map<String, dynamic> json,
) => _DeleteFcmTokenResponse(success: json['success'] as bool);

Map<String, dynamic> _$DeleteFcmTokenResponseToJson(
  _DeleteFcmTokenResponse instance,
) => <String, dynamic>{'success': instance.success};

_LookupResponse _$LookupResponseFromJson(Map<String, dynamic> json) =>
    _LookupResponse(
      def: (json['def'] as List<dynamic>)
          .map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
      head: json['head'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$LookupResponseToJson(_LookupResponse instance) =>
    <String, dynamic>{'def': instance.def, 'head': instance.head};
