import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nim2book_mobile_flutter/core/database/database.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:workmanager/workmanager.dart';

String _notificationChannelId() => 'review_reminders';

String _notificationChannelName() => 'Review reminders';

int _notificationId() => 1001;

@pragma('vm:entry-point')
void reviewReminderCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task != 'check_due_cards_task') {
      return true;
    }

    final logger = TalkerFlutter.init();

    try {
      final database = Database();
      final dictionaryService = DictionaryService.background(logger, database);

      final dueCardsCount = await dictionaryService.getDueCardsCount();
      logger.debug('Review reminder check: due=$dueCardsCount');

      await showReviewReminderNotification(dueCardsCount);
    } catch (e) {
      logger.error('Background review reminder failed: $e');
    }

    return true;
  });
}

Future<void> initializeReviewReminders() async {
  final logger = TalkerFlutter.init();

  if (kIsWeb) {
    logger.debug('Review reminders are not supported on web');
    return;
  }

  if (defaultTargetPlatform == TargetPlatform.android) {
    await Workmanager().initialize(reviewReminderCallbackDispatcher);
    await Workmanager().registerPeriodicTask(
      'check_due_cards_task',
      'check_due_cards_unique_work',
      frequency: const Duration(minutes: 15),
    );
    logger.debug('Review reminders initialized on Android');
    return;
  }

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    // todo: iOS implementation
    logger.debug('Review reminders are not implemented on iOS yet');
    return;
  }

  logger.debug('Review reminders are not configured for this platform');
}

Future<void> showReviewReminderNotification(int dueCardsCount) async {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  await notificationsPlugin.show(
    _notificationId(),
    'Nim2Book: время повторения',
    'Можно повторить $dueCardsCount слов. Вернитесь в приложение Nim2Book.',
    NotificationDetails(
      android: AndroidNotificationDetails(
        _notificationChannelId(),
        _notificationChannelName(),
        importance: Importance.high,
        priority: Priority.high,
      ),
    ),
  );
}
