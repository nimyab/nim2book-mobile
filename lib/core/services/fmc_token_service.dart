import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';

class FcmTokenService {
  final _apiClient = GetIt.I<ApiClient>();
  final _logger = Logger();

  FcmTokenService() {
    _initializeFirebaseMessaging();
  }

  void _initializeFirebaseMessaging() {
    // Обновление токена
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      _apiClient.addFcmToken(AddFcmTokenRequest(fcmToken: fcmToken));
    });

    // Обработка уведомлений когда приложение в foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.i(message);
    });

    // Обработка нажатий на уведомления когда приложение в background/terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _logger.i(message);
    });
  }

  Future<bool> addFcmToken() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken == null) return false;
      final response = await _apiClient.addFcmToken(
        AddFcmTokenRequest(fcmToken: fcmToken),
      );
      return response.success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteFcmToken() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken == null) return false;
      final response = await _apiClient.deleteFcmToken(fcmToken);
      return response.success;
    } catch (e) {
      return false;
    }
  }
}
