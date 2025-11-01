import 'package:freezed_annotation/freezed_annotation.dart';

part 'requests.freezed.dart';
part 'requests.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
abstract class GoogleLoginRequest with _$GoogleLoginRequest {
  const factory GoogleLoginRequest({required String idToken}) =
      _GoogleLoginRequest;

  factory GoogleLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestFromJson(json);
}

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String email,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
abstract class RefreshRequest with _$RefreshRequest {
  const factory RefreshRequest({required String refreshToken}) =
      _RefreshRequest;

  factory RefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);
}

@freezed
abstract class AddFcmTokenRequest with _$AddFcmTokenRequest {
  const factory AddFcmTokenRequest({required String fcmToken}) =
      _AddFcmTokenRequest;

  factory AddFcmTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$AddFcmTokenRequestFromJson(json);
}

@freezed
abstract class LookupRequest with _$LookupRequest {
  const factory LookupRequest({
    required String text,
    required String lang,
    required String ui,
  }) = _LookupRequest;

  factory LookupRequest.fromJson(Map<String, dynamic> json) =>
      _$LookupRequestFromJson(json);
}
