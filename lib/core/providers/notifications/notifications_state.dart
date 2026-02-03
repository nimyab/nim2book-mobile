import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
sealed class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default('') String fcmToken,
    @Default(false) bool isTokenRegistered,
    @Default(true) bool notificationsEnabled,
    @Default([]) List<Map<String, dynamic>> notifications,
    @Default(0) int unreadCount,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _NotificationsState;
}
