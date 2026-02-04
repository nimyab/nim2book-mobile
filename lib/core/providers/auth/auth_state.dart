import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.start() = _AuthStateStart;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.authenticated({required User user}) =
      _AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = _AuthStateUnauthenticated;
}
