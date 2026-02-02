import 'package:freezed_annotation/freezed_annotation.dart';

part 'requests.freezed.dart';
part 'requests.g.dart';

@freezed
abstract class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required final String email,
    required final String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(final Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
abstract class GoogleLoginRequest with _$GoogleLoginRequest {
  const factory GoogleLoginRequest({required final String idToken}) =
      _GoogleLoginRequest;

  factory GoogleLoginRequest.fromJson(final Map<String, dynamic> json) =>
      _$GoogleLoginRequestFromJson(json);
}

@freezed
abstract class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required final String email,
    required final String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(final Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}

@freezed
abstract class RefreshRequest with _$RefreshRequest {
  const factory RefreshRequest({required final String refreshToken}) =
      _RefreshRequest;

  factory RefreshRequest.fromJson(final Map<String, dynamic> json) =>
      _$RefreshRequestFromJson(json);
}

@freezed
abstract class AddFcmTokenRequest with _$AddFcmTokenRequest {
  const factory AddFcmTokenRequest({required final String fcmToken}) =
      _AddFcmTokenRequest;

  factory AddFcmTokenRequest.fromJson(final Map<String, dynamic> json) =>
      _$AddFcmTokenRequestFromJson(json);
}

@freezed
abstract class LookupRequest with _$LookupRequest {
  const factory LookupRequest({
    required final String text,
    required final String fromLang,
    required final String toLang,
    required final String ui,
  }) = _LookupRequest;

  factory LookupRequest.fromJson(final Map<String, dynamic> json) =>
      _$LookupRequestFromJson(json);
}

@freezed
abstract class CreateGenreRequest with _$CreateGenreRequest {
  const factory CreateGenreRequest({required final String name}) =
      _CreateGenreRequest;

  factory CreateGenreRequest.fromJson(final Map<String, dynamic> json) =>
      _$CreateGenreRequestFromJson(json);
}

@freezed
abstract class UpdateGenreRequest with _$UpdateGenreRequest {
  const factory UpdateGenreRequest({
    required final String id,
    required final String name,
  }) = _UpdateGenreRequest;

  factory UpdateGenreRequest.fromJson(final Map<String, dynamic> json) =>
      _$UpdateGenreRequestFromJson(json);
}

@freezed
abstract class UpdateMetadataRequest with _$UpdateMetadataRequest {
  const factory UpdateMetadataRequest({
    required final Map<String, dynamic> metadata,
  }) = _UpdateMetadataRequest;

  factory UpdateMetadataRequest.fromJson(final Map<String, dynamic> json) =>
      _$UpdateMetadataRequestFromJson(json);
}

@freezed
abstract class NotificationTestRequest with _$NotificationTestRequest {
  const factory NotificationTestRequest({
    final String? title,
    final String? body,
  }) = _NotificationTestRequest;

  factory NotificationTestRequest.fromJson(final Map<String, dynamic> json) =>
      _$NotificationTestRequestFromJson(json);
}
