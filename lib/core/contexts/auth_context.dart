import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';
import 'package:nim2book_mobile_flutter/core/services/fmc_token_service.dart';

class AuthContext with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  bool _isInitialized = false;
  final _apiClient = GetIt.I.get<ApiClient>();
  final _fcmTokenService = GetIt.I.get<FcmTokenService>();

  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;

  set _internalIsLoading(final bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isAdmin => _user?.isAdmin ?? false;
  bool get isVIP => _user?.isVIP ?? false;

  Future<bool> getUser() async {
    if (_isInitialized) return isAuthenticated;

    try {
      _internalIsLoading = true;
      final response = await _apiClient.getMe();
      _user = response.user;
      _isInitialized = true;
      return true;
    } catch (e) {
      _isInitialized = false;
      return false;
    } finally {
      _internalIsLoading = false;
    }
  }

  Future<bool> login(final String email, final String password) async {
    try {
      _internalIsLoading = true;
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      _user = response.user;

      unawaited(_fcmTokenService.addFcmToken());

      _isInitialized = true;
      return true;
    } catch (e) {
      return false;
    } finally {
      _internalIsLoading = false;
    }
  }

  Future<bool> googleLogin(final String idToken) async {
    try {
      _internalIsLoading = true;
      final response = await _apiClient.googleLogin(
        GoogleLoginRequest(idToken: idToken),
      );
      _user = response.user;

      unawaited(_fcmTokenService.addFcmToken());

      _isInitialized = true;
      return true;
    } catch (e) {
      return false;
    } finally {
      _internalIsLoading = false;
    }
  }

  Future<bool> logout() async {
    try {
      _internalIsLoading = true;
      await _apiClient.logout();
      _user = null;

      unawaited(_fcmTokenService.deleteFcmToken());

      _isInitialized = true;
      return true;
    } catch (e) {
      return false;
    } finally {
      _internalIsLoading = false;
    }
  }

  Future<bool> register(final String email, final String password) async {
    try {
      _internalIsLoading = true;
      final response = await _apiClient.register(
        RegisterRequest(email: email, password: password),
      );
      return response.success;
    } catch (e) {
      return false;
    } finally {
      _internalIsLoading = false;
    }
  }
}
