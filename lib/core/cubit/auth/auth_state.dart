import 'package:equatable/equatable.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Начальное состояние
class AuthInitial extends AuthState {}

// Проверка сохраненной авторизации
class AuthChecking extends AuthState {}

// Процесс входа/регистрации
class AuthLoading extends AuthState {}

// Пользователь авторизован
class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

// Пользователь не авторизован
class AuthUnauthenticated extends AuthState {}

// Ошибка авторизации
class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

// Успешная регистрация (можно показать приветствие)
class AuthRegistered extends AuthState {
  final bool success;

  AuthRegistered(this.success);

  @override
  List<Object?> get props => [success];
}
