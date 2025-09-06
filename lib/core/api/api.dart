import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:nim2book_mobile_flutter/core/models/responses/responses.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ApiClient {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  final _tokenStorage = const FlutterSecureStorage();

  late final Dio _dio;

  String? _accessToken;
  String? _refreshToken;
  bool _isRefreshing = false;
  final List<RequestOptions> _pendingRequests = [];

  ApiClient(String baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));

    // Инициализируем токены из хранилища
    _initializeTokens();

    _dio.interceptors.add(TalkerDioLogger(talker: GetIt.I.get<Talker>()));
    // Add auth interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (_accessToken != null) {
            options.headers['Authorization'] = 'Bearer $_accessToken';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 && _refreshToken != null) {
            // Если уже идет процесс обновления токена, добавляем запрос в очередь
            if (_isRefreshing) {
              _pendingRequests.add(error.requestOptions);
              return;
            }

            _isRefreshing = true;

            try {
              // Обновляем токен
              final refreshResponse = await _refreshTokens();
              await _setTokens(
                refreshResponse.accessToken,
                refreshResponse.refreshToken,
              );

              // Повторяем оригинальный запрос с новым токеном
              error.requestOptions.headers['Authorization'] =
                  'Bearer $_accessToken';
              final response = await _dio.fetch(error.requestOptions);

              // Обрабатываем отложенные запросы
              for (final pendingRequest in _pendingRequests) {
                pendingRequest.headers['Authorization'] =
                    'Bearer $_accessToken';
                _dio.fetch(pendingRequest);
              }
              _pendingRequests.clear();

              handler.resolve(response);
            } catch (refreshError) {
              // Если обновление токена не удалось, очищаем токены
              await _clearTokens();
              _pendingRequests.clear();
              handler.next(error);
            } finally {
              _isRefreshing = false;
            }
          } else {
            handler.next(error);
          }
        },
      ),
    );
  }

  // Методы для работы с безопасным хранилищем
  Future<void> _initializeTokens() async {
    _accessToken = await _tokenStorage.read(key: _accessTokenKey);
    _refreshToken = await _tokenStorage.read(key: _refreshTokenKey);
  }

  Future<void> _setTokens(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    await Future.wait([
      _tokenStorage.write(key: _accessTokenKey, value: accessToken),
      _tokenStorage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<void> _clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    await Future.wait([
      _tokenStorage.delete(key: _accessTokenKey),
      _tokenStorage.delete(key: _refreshTokenKey),
    ]);
  }

  Future<RefreshResponse> _refreshTokens() async {
    if (_refreshToken == null) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'No refresh token available',
      );
    }

    final request = RefreshRequest(refreshToken: _refreshToken!);
    final response = await _dio.post('/api/v1/auth/refresh', data: request.toJson());
    return RefreshResponse.fromJson(response.data);
  }

  // Auth endpoints
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dio.post('/api/v1/auth/login', data: request.toJson());
    final loginResponse = LoginResponse.fromJson(response.data);

    // Сохраняем токены после успешного логина
    await _setTokens(loginResponse.accessToken, loginResponse.refreshToken);

    return loginResponse;
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await _dio.post('/api/v1/auth/register', data: request.toJson());
    return RegisterResponse.fromJson(response.data);
  }

  Future<RefreshResponse> refresh(RefreshRequest request) async {
    final response = await _dio.post('/api/v1/auth/refresh', data: request.toJson());
    return RefreshResponse.fromJson(response.data);
  }

  Future<LogoutResponse> logout() async {
    final response = await _dio.post('/api/v1/auth/logout');
    final logoutResponse = LogoutResponse.fromJson(response.data);

    // Очищаем токены после logout
    await _clearTokens();

    return logoutResponse;
  }

  // User endpoints
  Future<MeResponse> getMe() async {
    final response = await _dio.get('/api/v1/user/me');
    return MeResponse.fromJson(response.data);
  }

  // Book endpoints
  Future<GetBooksResponse> getBooks({
    String? author,
    String? title,
    required String page,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
    };

    final response = await _dio.get('/api/v1/book', queryParameters: queryParams);
    return GetBooksResponse.fromJson(response.data);
  }

  Future<GetBookResponse> getBook(String id) async {
    final response = await _dio.get('/api/v1/book/$id');
    return GetBookResponse.fromJson(response.data);
  }

  Future<ChapterAlignNode> getChapter(String path) async {
    final response = await _dio.get('/api/v1/book/get-chapter/$path');
    return ChapterAlignNode.fromJson(response.data);
  }

  Future<TranslateBookResponse> translateBook({
    required File file,
    required String from,
    required String to,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      'from': from,
      'to': to,
    });

    final response = await _dio.post(
      '/api/v1/translate/book',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return TranslateBookResponse.fromJson(response.data);
  }

  // Dictionary endpoints
  Future<LookupResponse> lookup(LookupRequest request) async {
    final response = await _dio.post(
      '/api/v1/dictionary/lookup',
      data: request.toJson(),
    );
    return LookupResponse.fromJson(response.data);
  }
}
