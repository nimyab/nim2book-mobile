import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    final User? user,
    @Default(false) final bool isLoading,
    @Default(false) final bool isInitialized,
  }) = _AuthState;

  bool get isAuthenticated => user != null;
  bool get isAdmin => user?.isAdmin ?? false;
  bool get isVIP => user?.isVIP ?? false;
}
