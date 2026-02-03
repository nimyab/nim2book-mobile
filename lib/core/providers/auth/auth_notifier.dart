import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/providers/auth/auth_state.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/fmc_token_service.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final ApiClient _apiClient;
  late final FcmTokenService _fcmTokenService;

  @override
  AuthState build() {
    _apiClient = ref.read(apiClientProvider);
    _fcmTokenService = ref.read(fcmTokenServiceProvider);
    return const AuthState();
  }

  Future<bool> initialize() async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await _apiClient.getMe();
      state = state.copyWith(user: response.user, isLoading: false);
      return true;
    } catch (_) {
      state = state.copyWith(isLoading: false);
      return false;
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  Future<bool> login(final String email, final String password) async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      state = state.copyWith(user: response.user);
      unawaited(_fcmTokenService.addFcmToken());
      return true;
    } catch (_) {
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> googleLogin(final String idToken) async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await _apiClient.googleLogin(
        GoogleLoginRequest(idToken: idToken),
      );
      state = state.copyWith(user: response.user);
      unawaited(_fcmTokenService.addFcmToken());
      return true;
    } catch (_) {
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> logout() async {
    try {
      state = state.copyWith(isLoading: true);
      await _fcmTokenService.deleteFcmToken();
      await _apiClient.logout();
      state = state.copyWith(user: null);
      return true;
    } catch (_) {
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> register(final String email, final String password) async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await _apiClient.register(
        RegisterRequest(email: email, password: password),
      );
      return response.success;
    } catch (_) {
      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);
