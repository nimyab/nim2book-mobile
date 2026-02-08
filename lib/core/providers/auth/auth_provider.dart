import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';
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
    } catch (_) {
      state = const AuthState.unauthenticated();
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
    } catch (_) {
      state = const AuthState.unauthenticated();
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
      return response.success;
    } catch (_) {
      return false;
    } finally {
      state = const AuthState.unauthenticated();
    }
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
