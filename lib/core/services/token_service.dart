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

  Future<void> setTokens(
    final String accessToken,
    final String refreshToken,
  ) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    await Future.wait([
      _tokenStorage.write(key: _accessTokenKey, value: accessToken),
      _tokenStorage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    await Future.wait([
      _tokenStorage.delete(key: _accessTokenKey),
      _tokenStorage.delete(key: _refreshTokenKey),
    ]);
  }
}
