import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/user/user.dart';

class AuthContext with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  bool _isInitialized = false;
  final _apiClient = GetIt.I.get<ApiClient>();

  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;
  
  set _internalIsLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
    }
  }

  User? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isAdmin => _user?.isAdmin ?? false;

  Future<bool> getUser() async {
    if (_isInitialized) return isAuthenticated;
    
    try {
      _internalIsLoading = true;
      final response = await _apiClient.getMe();
      _user = response.user;
      _isInitialized = true;
      return true;
    } catch (e) {
      _isInitialized = true;
      return false;
    } finally {
      _internalIsLoading = false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      _internalIsLoading = true;
      final response = await _apiClient.login(
        LoginRequest(email: email, password: password),
      );
      _user = response.user;
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
      _isInitialized = true;
      return true;
    } catch (e) {
      return false;
    } finally {
      _internalIsLoading = false;
    }
  }

  Future<bool> register(String email, String password) async {
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
