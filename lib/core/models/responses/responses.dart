import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/book/book.dart';
import 'package:nim2book_mobile_flutter/core/models/dictionary/dictionary.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';

part 'responses.freezed.dart';
part 'responses.g.dart';

// Auth responses
@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => 
      _$LoginResponseFromJson(json);
}

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required bool success,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => 
      _$RegisterResponseFromJson(json);
}

@freezed
abstract class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    required String accessToken,
    required String refreshToken,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) => 
      _$RefreshResponseFromJson(json);
}

@freezed
abstract class LogoutResponse with _$LogoutResponse {
  const factory LogoutResponse({
    required bool success,
  }) = _LogoutResponse;

  factory LogoutResponse.fromJson(Map<String, dynamic> json) => 
      _$LogoutResponseFromJson(json);
}

// User responses
@freezed
abstract class MeResponse with _$MeResponse {
  const factory MeResponse({
    required User user,
  }) = _MeResponse;

  factory MeResponse.fromJson(Map<String, dynamic> json) => 
      _$MeResponseFromJson(json);
}

// Book responses
@freezed
abstract class GetBooksResponse with _$GetBooksResponse {
  const factory GetBooksResponse({
    required List<Book> books,
  }) = _GetBooksResponse;

  factory GetBooksResponse.fromJson(Map<String, dynamic> json) => 
      _$GetBooksResponseFromJson(json);
}

@freezed
abstract class GetBookResponse with _$GetBookResponse {
  const factory GetBookResponse({
    required Book book,
  }) = _GetBookResponse;

  factory GetBookResponse.fromJson(Map<String, dynamic> json) => 
      _$GetBookResponseFromJson(json);
}

@freezed
abstract class TranslateBookResponse with _$TranslateBookResponse {
  const factory TranslateBookResponse({
    required Book book,
    required String message,
  }) = _TranslateBookResponse;

  factory TranslateBookResponse.fromJson(Map<String, dynamic> json) => 
      _$TranslateBookResponseFromJson(json);
}

// Dictionary response
@freezed
abstract class LookupResponse with _$LookupResponse {
  const factory LookupResponse({
    required List<Definition> def,
    Map<String, dynamic>? head,
  }) = _LookupResponse;

  factory LookupResponse.fromJson(Map<String, dynamic> json) => 
      _$LookupResponseFromJson(json);
}