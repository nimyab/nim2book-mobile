import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/bloc/auth/auth_state.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/services/fmc_token_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiClient _apiClient = GetIt.I.get<ApiClient>();
  final FcmTokenService _fcmTokenService = GetIt.I.get<FcmTokenService>();

  AuthCubit() : super(const AuthState());

  Future<bool> getUser() async {
    if (state.isInitialized) return state.isAuthenticated;
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _apiClient.getMe();
      emit(
        state.copyWith(
          user: response.user,
          isInitialized: true,
          isLoading: false,
        ),
      );
      return true;
    } catch (_) {
      emit(state.copyWith(isInitialized: false, isLoading: false));
      return false;
    }
  }

  Future<bool> login(final String email, final String password) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      emit(state.copyWith(user: response.user, isInitialized: true));
      unawaited(_fcmTokenService.addFcmToken());
      return true;
    } catch (_) {
      return false;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<bool> googleLogin(final String idToken) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _apiClient.googleLogin(
        GoogleLoginRequest(idToken: idToken),
      );
      emit(state.copyWith(user: response.user, isInitialized: true));
      unawaited(_fcmTokenService.addFcmToken());
      return true;
    } catch (_) {
      return false;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<bool> logout() async {
    try {
      emit(state.copyWith(isLoading: true));
      await _fcmTokenService.deleteFcmToken();
      await _apiClient.logout();
      emit(state.copyWith(user: null, isInitialized: true));
      return true;
    } catch (_) {
      return false;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<bool> register(final String email, final String password) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _apiClient.register(
        RegisterRequest(email: email, password: password),
      );
      return response.success;
    } catch (_) {
      return false;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
