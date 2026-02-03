import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nim2book_mobile_flutter/core/env/env.dart';
import 'package:nim2book_mobile_flutter/core/models/chapter/chapter.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:nim2book_mobile_flutter/core/models/responses/responses.dart';
import 'package:nim2book_mobile_flutter/core/services/token_service.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ApiClient {
  final TokenService _tokenService;
  final Env _env;
  final Talker _talker;

  late final Dio _dio;

  bool _isRefreshing = false;
  final List<RequestOptions> _pendingRequests = [];

  ApiClient({
    required TokenService tokenService,
    required Env env,
    required Talker talker,
  }) : _tokenService = tokenService,
       _env = env,
       _talker = talker {
    _dio = Dio(BaseOptions(baseUrl: _env.apiBaseUrl));

    _dio.interceptors.add(
      TalkerDioLogger(
        talker: _talker,
        settings: TalkerDioLoggerSettings(
          printRequestHeaders: true,
          responseFilter: (response) {
            final uri = response.realUri.toString();
            final flag =
                uri.contains('/chapters/') ||
                uri.contains('/book') ||
                uri.contains('/personal-user-book');
            return !flag;
          },
        ),
      ),
    );

    // Add auth interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (final options, final handler) {
          options.headers['Authorization'] =
              'Bearer ${_tokenService.accessToken}';
          handler.next(options);
        },
        onError: (final error, final handler) async {
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
              final response = await _dio.fetch<Object?>(error.requestOptions);

              // Обрабатываем отложенные запросы
              for (final pendingRequest in _pendingRequests) {
                pendingRequest.headers['Authorization'] =
                    'Bearer ${_tokenService.accessToken}';
                // Отложенные запросы выполняются, но не через handler
                await _dio.fetch<Object?>(pendingRequest);
              }
              _pendingRequests.clear();

              handler.resolve(response);
            } catch (refreshError) {
              _pendingRequests.clear();
              await _tokenService.clearTokens();
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
  Future<LoginResponse> login(final LoginRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/login',
      data: request.toJson(),
    );
    final loginResponse = LoginResponse.fromJson(response.data!);

    await _tokenService.setTokens(
      loginResponse.accessToken,
      loginResponse.refreshToken,
    );

    return loginResponse;
  }

  Future<GoogleLoginResponse> googleLogin(
    final GoogleLoginRequest request,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/google-login',
      data: request.toJson(),
    );
    final googleLoginResponse = GoogleLoginResponse.fromJson(response.data!);

    await _tokenService.setTokens(
      googleLoginResponse.accessToken,
      googleLoginResponse.refreshToken,
    );

    return googleLoginResponse;
  }

  Future<RegisterResponse> register(final RegisterRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/register',
      data: request.toJson(),
    );
    return RegisterResponse.fromJson(response.data!);
  }

  Future<RefreshResponse> _refresh(final RefreshRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/refresh',
      data: request.toJson(),
    );
    return RefreshResponse.fromJson(response.data!);
  }

  Future<LogoutResponse> logout() async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/auth/logout',
    );
    final logoutResponse = LogoutResponse.fromJson(response.data!);

    // Очищаем токены после logout
    await _tokenService.clearTokens();

    return logoutResponse;
  }

  // User endpoints
  Future<MeResponse> getMe() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/v1/user/me');
    return MeResponse.fromJson(response.data!);
  }

  Future<UpdateMetadataResponse> updateMetadata(
    final UpdateMetadataRequest request,
  ) async {
    final response = await _dio.put<Map<String, dynamic>>(
      '/api/v1/user/metadata',
      data: request.toJson(),
    );
    return UpdateMetadataResponse.fromJson(response.data!);
  }

  // Book endpoints
  Future<GetBooksResponse> getBooks({
    final String? author,
    final String? title,
    final String? genreId,
    required final int page,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (genreId != null) 'genreId': genreId,
    };

    final response = await _dio.get<Map<String, dynamic>>(
      '/api/v1/book',
      queryParameters: queryParams,
    );
    return GetBooksResponse.fromJson(response.data!);
  }

  Future<GetBookResponse> getBook(final String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/v1/book/$id');
    return GetBookResponse.fromJson(response.data!);
  }

  Future<ChapterAlignNode> getChapter(final String path) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/v1/book/get-chapter/$path',
    );
    return ChapterAlignNode.fromJson(response.data!);
  }

  Future<UpdateBookResponse> updateBook({
    required final String id,
    final String? title,
    final String? author,
    final File? cover,
  }) async {
    final formData = FormData();

    if (title != null) formData.fields.add(MapEntry('title', title));
    if (author != null) formData.fields.add(MapEntry('author', author));
    if (cover != null) {
      formData.files.add(
        MapEntry('cover', await MultipartFile.fromFile(cover.path)),
      );
    }

    final response = await _dio.put<Map<String, dynamic>>(
      '/api/v1/book/$id',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return UpdateBookResponse.fromJson(response.data!);
  }

  // Personal User Book endpoints
  Future<GetPersonalUserBooksResponse> getPersonalUserBooks({
    final String? author,
    final String? title,
    final String? genreId,
    required final int page,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (genreId != null) 'genreId': genreId,
    };

    final response = await _dio.get<Map<String, dynamic>>(
      '/api/v1/personal-user-book',
      queryParameters: queryParams,
    );
    return GetPersonalUserBooksResponse.fromJson(response.data!);
  }

  Future<GetPersonalUserBookResponse> getPersonalUserBook(
    final String id,
  ) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/api/v1/personal-user-book/$id',
    );
    return GetPersonalUserBookResponse.fromJson(response.data!);
  }

  Future<UpdatePersonalUserBookResponse> updatePersonalUserBook({
    required final String id,
    final String? title,
    final String? author,
    final File? cover,
  }) async {
    final formData = FormData();

    if (title != null) formData.fields.add(MapEntry('title', title));
    if (author != null) formData.fields.add(MapEntry('author', author));
    if (cover != null) {
      formData.files.add(
        MapEntry('cover', await MultipartFile.fromFile(cover.path)),
      );
    }

    final response = await _dio.put<Map<String, dynamic>>(
      '/api/v1/personal-user-book/$id',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return UpdatePersonalUserBookResponse.fromJson(response.data!);
  }

  // Translate endpoints
  Future<TranslateBookResponse> translateBook({
    required final File file,
    required final String from,
    required final String to,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      'from': from,
      'to': to,
    });

    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/translate/book',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return TranslateBookResponse.fromJson(response.data!);
  }

  Future<TranslatePersonalUserBookResponse> translatePersonalUserBook({
    required final File file,
    required final String from,
    required final String to,
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      'from': from,
      'to': to,
    });

    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/translate/personal-user-book',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return TranslatePersonalUserBookResponse.fromJson(response.data!);
  }

  // Dictionary endpoints
  Future<LookupResponse> lookup(final LookupRequest request) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/dictionary/lookup',
      data: request.toJson(),
    );
    return LookupResponse.fromJson(response.data!);
  }

  // Genre endpoints
  Future<GetGenresResponse> getGenres() async {
    final response = await _dio.get<Map<String, dynamic>>('/api/v1/genre');
    return GetGenresResponse.fromJson(response.data!);
  }

  Future<GetGenreResponse> getGenre(final String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/api/v1/genre/$id');
    return GetGenreResponse.fromJson(response.data!);
  }

  // FCM token endpoints
  Future<AddFcmTokenResponse> addFcmToken(
    final AddFcmTokenRequest request,
  ) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/v1/fcm-token/add',
      data: request.toJson(),
    );
    return AddFcmTokenResponse.fromJson(response.data!);
  }

  Future<DeleteFcmTokenResponse> deleteFcmToken(final String token) async {
    final response = await _dio.delete<Map<String, dynamic>>(
      '/api/v1/fcm-token/delete',
      queryParameters: {'token': token},
    );
    return DeleteFcmTokenResponse.fromJson(response.data!);
  }

  // File endpoints
  Future<File> getPublicFile(final String path) async {
    final response = await _dio.get<String>(
      '/api/v1/file/public',
      queryParameters: {'path': path},
    );
    return File(response.data!);
  }
}
