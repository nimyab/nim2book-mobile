import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';
import 'package:nim2book_mobile_flutter/core/providers/auth/auth_state.dart';
export 'package:nim2book_mobile_flutter/core/providers/auth/auth_state.dart';

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
    return const AuthState.start();
  }

  Future<bool> initialize() async {
    try {
      final response = await _apiClient.getMe();
      state = AuthState.authenticated(user: response.user);
      return true;
    } catch (_) {
      state = const AuthState.unauthenticated();
      return false;
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  Future<bool> login(final String email, final String password) async {
    try {
      state = const AuthState.loading();
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      state = AuthState.authenticated(user: response.user);
      unawaited(_fcmTokenService.addFcmToken());
      return true;
    } catch (e) {
      state = AuthState.error(message: _getErrorMessage(e));
      return false;
    }
  }

  Future<bool> googleLogin(final String idToken) async {
    try {
      state = const AuthState.loading();
      final response = await _apiClient.googleLogin(
        GoogleLoginRequest(idToken: idToken),
      );
      state = AuthState.authenticated(user: response.user);
      unawaited(_fcmTokenService.addFcmToken());
      return true;
    } catch (e) {
      state = AuthState.error(message: _getErrorMessage(e));
      return false;
    }
  }

  Future<bool> logout() async {
    final currentState = state;
    try {
      state = const AuthState.loading();
      await _fcmTokenService.deleteFcmToken();
      await _apiClient.logout();
      state = const AuthState.unauthenticated();
      return true;
    } catch (_) {
      state = currentState;
      return false;
    }
  }

  Future<bool> register(final String email, final String password) async {
    try {
      state = const AuthState.loading();
      final response = await _apiClient.register(
        RegisterRequest(email: email, password: password),
      );
      // Registration successful, go to login (unauthenticated)
      state = const AuthState.unauthenticated();
      return response.success;
    } catch (e) {
      state = AuthState.error(message: _getErrorMessage(e));
      return false;
    }
  }

  String _getErrorMessage(Object error) {
    if (error is DioException) {
      // Extract message from backend response if available
      if (error.response?.data is Map &&
          (error.response?.data as Map).containsKey('message')) {
        return (error.response?.data as Map)['message'].toString();
      }
      return error.message ?? 'An unknown error occurred';
    }
    return error.toString();
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(
  AuthNotifier.new,
);

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(
    authNotifierProvider.select((s) {
      return s.maybeWhen(authenticated: (_) => true, orElse: () => false);
    }),
  );
});

final isVIPProvider = Provider<bool>((ref) {
  return ref.watch(
    authNotifierProvider.select((s) {
      return s.maybeWhen(
        authenticated: (user) => user.isVIP,
        orElse: () => false,
      );
    }),
  );
});

final isAdminProvider = Provider<bool>((ref) {
  return ref.watch(
    authNotifierProvider.select((s) {
      return s.maybeWhen(
        authenticated: (user) => user.isAdmin,
        orElse: () => false,
      );
    }),
  );
});

final isAuthLoadingProvider = Provider<bool>((ref) {
  return ref.watch(
    authNotifierProvider.select((s) {
      return s.maybeWhen(loading: () => true, orElse: () => false);
    }),
  );
});

final userProvider = Provider<User?>((ref) {
  return ref.watch(
    authNotifierProvider.select((s) {
      return s.maybeWhen(authenticated: (user) => user, orElse: () => null);
    }),
  );
});
