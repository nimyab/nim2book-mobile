import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/personal_user_book/personal_user_book.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class GoogleAccount with _$GoogleAccount {
  const factory GoogleAccount({
    required String id,
    required String sub,
    required String email,
    required String name,
    required bool emailVerified,
    required String createdAt,
    String? picture,
  }) = _GoogleAccount;

  factory GoogleAccount.fromJson(Map<String, dynamic> json) =>
      _$GoogleAccountFromJson(json);
}

@freezed
sealed class BasicAccount with _$BasicAccount {
  const factory BasicAccount({
    required String id,
    required String email,
    required bool isVerified,
    required String createdAt,
    String? verifyLink,
  }) = _BasicAccount;

  factory BasicAccount.fromJson(Map<String, dynamic> json) =>
      _$BasicAccountFromJson(json);
}

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required bool isAdmin,
    required bool isVIP,
    required String createdAt,
    GoogleAccount? googleAccount,
    BasicAccount? basicAccount,
    Map<String, dynamic>? metadata,
    List<PersonalUserBook>? personalBooks,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
