import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/responses/responses.dart';
import 'package:nim2book_mobile_flutter/core/services/token_service.dart';

class ApiClient {
  final _tokenService = GetIt.I.get<TokenService>();
  final _logger = Logger();

  late final Dio _dio;

  bool _isRefreshing = false;
  final List<RequestOptions> _pendingRequests = [];

  ApiClient() {
    _dio = Dio(BaseOptions(baseUrl: GetIt.I.get<Env>().apiBaseUrl));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          _logger.i('Request: ${options.method} ${options.path}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.i(
            'Response [statusCode: ${response.statusCode}], path: ${response.requestOptions.path}, data: ${response.data}',
          );
          handler.next(response);
        },
        onError: (error, handler) {
          _logger.e(
            'Error [statusCode: ${error.response?.statusCode}], path: ${error.requestOptions.path}, errorData: ${error.response?.data}',
          );
          handler.next(error);
        },
      ),
    );

    // Add auth interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${_tokenService.accessToken}';
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 &&
              _tokenService.refreshToken != null) {
            // Если уже идет процесс обновления токена, добавляем запрос в очередь
            if (_isRefreshing) {
              _pendingRequests.add(error.requestOptions);
              return;
            }

            _isRefreshing = true;

            try {
              // Обновляем токен
              await _refreshTokens();

              error.requestOptions.headers['Authorization'] =
                  'Bearer ${_tokenService.accessToken}';
              final response = await _dio.fetch(error.requestOptions);

              handler.resolve(response);
            } catch (refreshError) {
              await _tokenService.clearTokens();
              handler.next(error);
            } finally {
              // Обрабатываем отложенные запросы
              for (final pendingRequest in _pendingRequests) {
                pendingRequest.headers['Authorization'] =
                    'Bearer ${_tokenService.accessToken}';
                _dio.fetch(pendingRequest);
              }
              _pendingRequests.clear();

              _isRefreshing = false;
            }
          } else {
            handler.next(error);
          }
        },
      ),
    );
  }

  Future<void> _refreshTokens() async {
    if (_tokenService.refreshToken == null) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'No refresh token available',
      );
    }

    final data = await _refresh(
      RefreshRequest(refreshToken: _tokenService.refreshToken!),
    );
    await _tokenService.setTokens(data.accessToken, data.refreshToken);
  }

  // Auth endpoints
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _dio.post(
      '/api/v1/auth/login',
      data: request.toJson(),
    );
    final loginResponse = LoginResponse.fromJson(response.data);

    await _tokenService.setTokens(
      loginResponse.accessToken,
      loginResponse.refreshToken,
    );

    return loginResponse;
  }

  Future<GoogleLoginResponse> googleLogin(GoogleLoginRequest request) async {
    final response = await _dio.post(
      '/api/v1/auth/google-login',
      data: request.toJson(),
    );
    final googleLoginResponse = GoogleLoginResponse.fromJson(response.data);

    await _tokenService.setTokens(
      googleLoginResponse.accessToken,
      googleLoginResponse.refreshToken,
    );

    return googleLoginResponse;
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await _dio.post(
      '/api/v1/auth/register',
      data: request.toJson(),
    );
    return RegisterResponse.fromJson(response.data);
  }

  Future<RefreshResponse> _refresh(RefreshRequest request) async {
    final response = await _dio.post(
      '/api/v1/auth/refresh',
      data: request.toJson(),
    );
    return RefreshResponse.fromJson(response.data);
  }

  Future<LogoutResponse> logout() async {
    final response = await _dio.post('/api/v1/auth/logout');
    final logoutResponse = LogoutResponse.fromJson(response.data);

    // Очищаем токены после logout
    await _tokenService.clearTokens();

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

    final response = await _dio.get(
      '/api/v1/book',
      queryParameters: queryParams,
    );
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

  Future<UpdateBookResponse> updateBook({
    required String id,
    String? title,
    String? author,
    File? cover,
  }) async {
    final formData = FormData();

    if (title != null) formData.fields.add(MapEntry('title', title));
    if (author != null) formData.fields.add(MapEntry('author', author));
    if (cover != null) {
      formData.files.add(
        MapEntry('cover', await MultipartFile.fromFile(cover.path)),
      );
    }

    final response = await _dio.put(
      '/api/v1/book/$id',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return UpdateBookResponse.fromJson(response.data);
  }

  // Dictionary endpoints
  Future<LookupResponse> lookup(LookupRequest request) async {
    final response = await _dio.post(
      '/api/v1/dictionary/lookup',
      data: request.toJson(),
    );
    return LookupResponse.fromJson(response.data);
  }

  // File endpoints
  Future<File> getPublicFile(String path) async {
    final response = await _dio.get(
      '/api/v1/file/public',
      queryParameters: {'path': path},
    );
    return File(response.data);
  }
}
