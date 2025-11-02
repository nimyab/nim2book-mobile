import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';

part 'responses.freezed.dart';
part 'responses.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required final String accessToken,
    required final String refreshToken,
    required final User user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(final Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class GoogleLoginResponse with _$GoogleLoginResponse {
  const factory GoogleLoginResponse({
    required final String accessToken,
    required final String refreshToken,
    required final User user,
  }) = _GoogleLoginResponse;

  factory GoogleLoginResponse.fromJson(final Map<String, dynamic> json) =>
      _$GoogleLoginResponseFromJson(json);
}

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({required final bool success}) =
      _RegisterResponse;

  factory RegisterResponse.fromJson(final Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
abstract class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    required final String accessToken,
    required final String refreshToken,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(final Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}

@freezed
abstract class LogoutResponse with _$LogoutResponse {
  const factory LogoutResponse({required final bool success}) = _LogoutResponse;

  factory LogoutResponse.fromJson(final Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}

@freezed
abstract class MeResponse with _$MeResponse {
  const factory MeResponse({required final User user}) = _MeResponse;

  factory MeResponse.fromJson(final Map<String, dynamic> json) =>
      _$MeResponseFromJson(json);
}

@freezed
abstract class GetBooksResponse with _$GetBooksResponse {
  const factory GetBooksResponse({required final List<Book> books}) =
      _GetBooksResponse;

  factory GetBooksResponse.fromJson(final Map<String, dynamic> json) =>
      _$GetBooksResponseFromJson(json);
}

@freezed
abstract class GetBookResponse with _$GetBookResponse {
  const factory GetBookResponse({required final Book book}) = _GetBookResponse;

  factory GetBookResponse.fromJson(final Map<String, dynamic> json) =>
      _$GetBookResponseFromJson(json);
}

@freezed
abstract class TranslateBookResponse with _$TranslateBookResponse {
  const factory TranslateBookResponse({
    final Book? book,
    final String? messageAboutTranslate,
  }) = _TranslateBookResponse;

  factory TranslateBookResponse.fromJson(final Map<String, dynamic> json) =>
      _$TranslateBookResponseFromJson(json);
}

@freezed
abstract class UpdateBookResponse with _$UpdateBookResponse {
  const factory UpdateBookResponse({required final Book book}) =
      _UpdateBookResponse;

  factory UpdateBookResponse.fromJson(final Map<String, dynamic> json) =>
      _$UpdateBookResponseFromJson(json);
}

@freezed
abstract class AddFcmTokenResponse with _$AddFcmTokenResponse {
  const factory AddFcmTokenResponse({required final bool success}) =
      _AddFcmTokenResponse;

  factory AddFcmTokenResponse.fromJson(final Map<String, dynamic> json) =>
      _$AddFcmTokenResponseFromJson(json);
}

@freezed
abstract class DeleteFcmTokenResponse with _$DeleteFcmTokenResponse {
  const factory DeleteFcmTokenResponse({required final bool success}) =
      _DeleteFcmTokenResponse;

  factory DeleteFcmTokenResponse.fromJson(final Map<String, dynamic> json) =>
      _$DeleteFcmTokenResponseFromJson(json);
}

@freezed
abstract class LookupResponse with _$LookupResponse {
  const factory LookupResponse({
    required final List<Definition> def,
    final Map<String, dynamic>? head,
  }) = _LookupResponse;

  factory LookupResponse.fromJson(final Map<String, dynamic> json) =>
      _$LookupResponseFromJson(json);
}
