import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nim2book_mobile_flutter/core/api/api.dart';
import 'package:nim2book_mobile_flutter/core/models/requests/requests.dart';
import 'package:talker_flutter/talker_flutter.dart';

class FcmTokenService {
  final ApiClient _apiClient;
  final Talker _logger;

  FcmTokenService(this._apiClient, this._logger) {
    _initializeFirebaseMessaging();
  }

  void _initializeFirebaseMessaging() {
    // Обновление токена
    FirebaseMessaging.instance.onTokenRefresh.listen((final fcmToken) {
      _apiClient.addFcmToken(AddFcmTokenRequest(fcmToken: fcmToken));
    });

    // Обработка уведомлений когда приложение в foreground
    FirebaseMessaging.onMessage.listen((final RemoteMessage message) {
      _logger.info(message);
    });

    // Обработка нажатий на уведомления когда приложение в background/terminated
    FirebaseMessaging.onMessageOpenedApp.listen((final RemoteMessage message) {
      _logger.info(message);
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
