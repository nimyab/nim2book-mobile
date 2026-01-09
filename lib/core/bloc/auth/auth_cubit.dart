import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/bloc/auth/auth_state.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/services/fmc_token_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final _apiClient = GetIt.I.get<ApiClient>();
  final _fcmTokenService = GetIt.I.get<FcmTokenService>();

  AuthCubit() : super(const AuthState());

  Future<bool> initialize() async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _apiClient.getMe();
      emit(state.copyWith(user: response.user, isLoading: false));
      return true;
    } catch (_) {
      emit(state.copyWith(isLoading: false));
      return false;
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  Future<bool> login(final String email, final String password) async {
    try {
      emit(state.copyWith(isLoading: true));
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      emit(state.copyWith(user: response.user));
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
      emit(state.copyWith(user: response.user));
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
      emit(state.copyWith(user: null));
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
