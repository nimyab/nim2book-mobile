import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  final _tokenStorage = const FlutterSecureStorage();
  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  static Future<TokenService> init() async {
    final tokenService = TokenService();
    await tokenService._loadTokens();
    return tokenService;
  }

  Future<void> _loadTokens() async {
    _accessToken = await _tokenStorage.read(key: _accessTokenKey);
    _refreshToken = await _tokenStorage.read(key: _refreshTokenKey);
  }

  /// Sets tokens in memory immediately and persists asynchronously without blocking
  Future<void> setTokens(
    final String accessToken,
    final String refreshToken,
  ) async {
    // Update in-memory values immediately
    _accessToken = accessToken;
    _refreshToken = refreshToken;

    // Persist to storage asynchronously without awaiting to avoid blocking
    // Using unawaited to explicitly mark fire-and-forget
    _tokenStorage.write(key: _accessTokenKey, value: accessToken).ignore();
    _tokenStorage.write(key: _refreshTokenKey, value: refreshToken).ignore();
  }

  /// Clears tokens from memory immediately and storage asynchronously
  Future<void> clearTokens() async {
    // Clear in-memory values immediately
    _accessToken = null;
    _refreshToken = null;

    // Delete from storage asynchronously without blocking
    _tokenStorage.delete(key: _accessTokenKey).ignore();
    _tokenStorage.delete(key: _refreshTokenKey).ignore();
  }
}
