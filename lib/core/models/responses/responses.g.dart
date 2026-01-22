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
  book: json['book'] == null
      ? null
      : Book.fromJson(json['book'] as Map<String, dynamic>),
  messageAboutTranslate: json['messageAboutTranslate'] as String?,
);

Map<String, dynamic> _$TranslateBookResponseToJson(
  _TranslateBookResponse instance,
) => <String, dynamic>{
  'book': instance.book,
  'messageAboutTranslate': instance.messageAboutTranslate,
};

_TranslatePersonalUserBookResponse _$TranslatePersonalUserBookResponseFromJson(
  Map<String, dynamic> json,
) => _TranslatePersonalUserBookResponse(
  book: json['book'] == null
      ? null
      : PersonalUserBook.fromJson(json['book'] as Map<String, dynamic>),
  messageAboutTranslate: json['messageAboutTranslate'] as String?,
);

Map<String, dynamic> _$TranslatePersonalUserBookResponseToJson(
  _TranslatePersonalUserBookResponse instance,
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
      words: (json['words'] as List<dynamic>)
          .map((e) => DictionaryWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookupResponseToJson(_LookupResponse instance) =>
    <String, dynamic>{'words': instance.words};

_GetGenresResponse _$GetGenresResponseFromJson(Map<String, dynamic> json) =>
    _GetGenresResponse(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGenresResponseToJson(_GetGenresResponse instance) =>
    <String, dynamic>{'genres': instance.genres};

_GetGenreResponse _$GetGenreResponseFromJson(Map<String, dynamic> json) =>
    _GetGenreResponse(
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetGenreResponseToJson(_GetGenreResponse instance) =>
    <String, dynamic>{'genre': instance.genre};

_CreateGenreResponse _$CreateGenreResponseFromJson(Map<String, dynamic> json) =>
    _CreateGenreResponse(
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateGenreResponseToJson(
  _CreateGenreResponse instance,
) => <String, dynamic>{'genre': instance.genre};

_UpdateGenreResponse _$UpdateGenreResponseFromJson(Map<String, dynamic> json) =>
    _UpdateGenreResponse(
      genre: Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateGenreResponseToJson(
  _UpdateGenreResponse instance,
) => <String, dynamic>{'genre': instance.genre};

_DeleteGenreResponse _$DeleteGenreResponseFromJson(Map<String, dynamic> json) =>
    _DeleteGenreResponse(success: json['success'] as bool);

Map<String, dynamic> _$DeleteGenreResponseToJson(
  _DeleteGenreResponse instance,
) => <String, dynamic>{'success': instance.success};

_GetPersonalUserBooksResponse _$GetPersonalUserBooksResponseFromJson(
  Map<String, dynamic> json,
) => _GetPersonalUserBooksResponse(
  books: (json['books'] as List<dynamic>)
      .map((e) => PersonalUserBook.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetPersonalUserBooksResponseToJson(
  _GetPersonalUserBooksResponse instance,
) => <String, dynamic>{'books': instance.books};

_GetPersonalUserBookResponse _$GetPersonalUserBookResponseFromJson(
  Map<String, dynamic> json,
) => _GetPersonalUserBookResponse(
  book: PersonalUserBook.fromJson(json['book'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetPersonalUserBookResponseToJson(
  _GetPersonalUserBookResponse instance,
) => <String, dynamic>{'book': instance.book};

_UpdatePersonalUserBookResponse _$UpdatePersonalUserBookResponseFromJson(
  Map<String, dynamic> json,
) => _UpdatePersonalUserBookResponse(
  book: PersonalUserBook.fromJson(json['book'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdatePersonalUserBookResponseToJson(
  _UpdatePersonalUserBookResponse instance,
) => <String, dynamic>{'book': instance.book};

_UpdateMetadataResponse _$UpdateMetadataResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateMetadataResponse(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateMetadataResponseToJson(
  _UpdateMetadataResponse instance,
) => <String, dynamic>{'user': instance.user};
