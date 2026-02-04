import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nim2book_mobile_flutter/core/providers/notifications/notifications_state.dart';
import 'package:nim2book_mobile_flutter/core/providers/providers.dart';
import 'package:nim2book_mobile_flutter/core/services/fmc_token_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsNotifier extends Notifier<NotificationsState> {
  late final FcmTokenService _fcmTokenService;

  @override
  NotificationsState build() {
    final service = ref.watch(fcmTokenServiceProvider);
    _fcmTokenService = service;
    _loadNotificationStatus();
    return const NotificationsState();
  }

  Future<void> _loadNotificationStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final token = await FirebaseMessaging.instance.getToken();

      state = state.copyWith(
        fcmToken: token ?? '',
        isTokenRegistered: token != null,
        isLoading: false,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> registerToken() async {
    state = state.copyWith(isLoading: true);
    try {
      final success = await _fcmTokenService.addFcmToken();
      if (success) {
        await _loadNotificationStatus();
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to register token',
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> unregisterToken() async {
    state = state.copyWith(isLoading: true);
    try {
      final success = await _fcmTokenService.deleteFcmToken();
      if (success) {
        state = state.copyWith(
          isTokenRegistered: false,
          isLoading: false,
          errorMessage: null,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to unregister token',
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> toggleNotifications() async {
    final newValue = !state.notificationsEnabled;
    state = state.copyWith(notificationsEnabled: newValue);

    if (newValue) {
      await registerToken();
    } else {
      await unregisterToken();
    }
  }

  void addNotification(Map<String, dynamic> notification) {
    final notifications = [...state.notifications, notification];
    state = state.copyWith(
      notifications: notifications,
      unreadCount: state.unreadCount + 1,
    );
  }

  void markAsRead(String notificationId) {
    final notifications = state.notifications.map((n) {
      if (n['id'] == notificationId) {
        return {...n, 'read': true};
      }
      return n;
    }).toList();

    final unreadCount = notifications.where((n) => n['read'] != true).length;

    state = state.copyWith(
      notifications: notifications,
      unreadCount: unreadCount,
    );
  }

  void markAllAsRead() {
    final notifications = state.notifications.map((n) {
      return {...n, 'read': true};
    }).toList();

    state = state.copyWith(notifications: notifications, unreadCount: 0);
  }

  void clearNotifications() {
    state = state.copyWith(notifications: [], unreadCount: 0);
  }

  void removeNotification(String notificationId) {
    final notifications = state.notifications
        .where((n) => n['id'] != notificationId)
        .toList();

    final unreadCount = notifications.where((n) => n['read'] != true).length;

    state = state.copyWith(
      notifications: notifications,
      unreadCount: unreadCount,
    );
  }

  Future<void> refresh() async {
    await _loadNotificationStatus();
  }
}

final notificationsNotifierProvider =
    NotifierProvider.autoDispose<NotificationsNotifier, NotificationsState>(
      NotificationsNotifier.new,
    );
