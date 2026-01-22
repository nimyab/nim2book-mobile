import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/genre/genre.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class GoogleAccount with _$GoogleAccount {
  const factory GoogleAccount({
    required final String sub,
    required final String email,
    required final String name,
    required final bool emailVerified,
    final String? picture,
  }) = _GoogleAccount;

  factory GoogleAccount.fromJson(final Map<String, dynamic> json) =>
      _$GoogleAccountFromJson(json);
}

@freezed
abstract class EmailPasswordAccount with _$EmailPasswordAccount {
  const factory EmailPasswordAccount({
    required final String id,
    required final String email,
  }) = _EmailPasswordAccount;

  factory EmailPasswordAccount.fromJson(final Map<String, dynamic> json) =>
      _$EmailPasswordAccountFromJson(json);
}

@freezed
abstract class PersonalUserBook with _$PersonalUserBook {
  const factory PersonalUserBook({
    required final String id,
    required final String title,
    required final String author,
    required final List<String> chapterPaths,
    required final String userId,
    final String? cover,
    final List<Genre>? genres,
  }) = _PersonalUserBook;

  factory PersonalUserBook.fromJson(final Map<String, dynamic> json) =>
      _$PersonalUserBookFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    required final String id,
    required final bool isAdmin,
    required final bool isVIP,
    final GoogleAccount? googleAccount,
    final EmailPasswordAccount? emailPasswordAccount,
    final Map<String, dynamic>? metadata,
    final List<PersonalUserBook>? personalUserBooks,
  }) = _User;

  factory User.fromJson(final Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
