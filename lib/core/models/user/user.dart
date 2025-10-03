import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class GoogleAccount with _$GoogleAccount {
  const factory GoogleAccount({
    required String sub,
    required String email,
    required String name,
    required bool emailVerified,
    String? picture,
  }) = _GoogleAccount;

  factory GoogleAccount.fromJson(Map<String, dynamic> json) =>
      _$GoogleAccountFromJson(json);
}

@freezed
abstract class EmailPasswordAccount with _$EmailPasswordAccount {
  const factory EmailPasswordAccount({
    required String id,
    required String email,
  }) = _EmailPasswordAccount;

  factory EmailPasswordAccount.fromJson(Map<String, dynamic> json) =>
      _$EmailPasswordAccountFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required bool isAdmin,
    required bool isVIP,
    GoogleAccount? googleAccount,
    EmailPasswordAccount? emailPasswordAccount,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
