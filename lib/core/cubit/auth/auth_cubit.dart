import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _apiClient = GetIt.I.get<ApiClient>();

  AuthCubit() : super(AuthInitial());

  // Проверка сохраненной авторизации при запуске
  Future<void> checkAuthStatus() async {
    emit(AuthChecking());

    try {
      final response = await _apiClient.getMe();
      emit(AuthAuthenticated(response.user));
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  // Вход в систему
  Future<void> login(String email, String password) async {
    if (state is AuthLoading) return;

    emit(AuthLoading());

    try {
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      emit(AuthAuthenticated(response.user));
    } catch (e) {
      emit(AuthError(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  // Регистрация
  Future<void> register(String email, String password) async {
    if (state is AuthLoading) return;

    emit(AuthLoading());

    try {
      final response = await _apiClient.register(
        RegisterRequest(email: email, password: password),
      );
      emit(AuthRegistered(response.success));
    } catch (e) {
      emit(AuthError(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  // Выход из системы
  Future<void> logout() async {
    try {
      await _apiClient.logout();
    } finally {
      emit(AuthUnauthenticated());
    }
  }

  // Очистка ошибок
  void clearError() {
    if (state is AuthError) {
      emit(AuthUnauthenticated());
    }
  }
}
