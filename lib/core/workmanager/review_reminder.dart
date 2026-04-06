import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nim2book_mobile_flutter/core/database/database.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:workmanager/workmanager.dart';

const _notificationChannelId = 'review_reminders';

const _notificationChannelName = 'Review reminders';

const _notificationId = 1001;

const _checkDueCardsTaskName = 'check_due_cards_task';

const _checkDueCardsUniqueWorkName = 'check_due_cards_unique_work';

const _androidNotificationIcon = 'splash';

Future<FlutterLocalNotificationsPlugin> _initializeNotificationsPlugin({
  bool requestPermission = false,
}) async {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();

  const initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings(_androidNotificationIcon),
  );

  await notificationsPlugin.initialize(initializationSettings);

  final androidImplementation = notificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  await androidImplementation?.createNotificationChannel(
    const AndroidNotificationChannel(
      _notificationChannelId,
      _notificationChannelName,
      importance: Importance.high,
    ),
  );

  if (requestPermission) {
    await androidImplementation?.requestNotificationsPermission();
  }

  return notificationsPlugin;
}

@pragma('vm:entry-point')
void reviewReminderCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();

    final logger = TalkerFlutter.init();
    logger.debug('Review reminder callback received task: $task');

    if (task != _checkDueCardsTaskName) {
      return true;
    }

    try {
      final database = Database();
      final dictionaryService = DictionaryService.background(logger, database);

      final dueCardsCount = await dictionaryService.getDueCardsCount();
      logger.debug('Review reminder check: due=$dueCardsCount');

      if (dueCardsCount > 0) {
        await showReviewReminderNotification(dueCardsCount);
      }
    } catch (e, st) {
      logger.error('Background review reminder failed: $e', st);
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
    await _initializeNotificationsPlugin(requestPermission: true);

    await Workmanager().initialize(reviewReminderCallbackDispatcher);
    await Workmanager().registerPeriodicTask(
      _checkDueCardsUniqueWorkName,
      _checkDueCardsTaskName,
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
  final notificationsPlugin = await _initializeNotificationsPlugin();

  await notificationsPlugin.show(
    _notificationId,
    'Nim2Book: время повторения',
    'Можно повторить $dueCardsCount слов. Вернитесь в приложение Nim2Book.',
    const NotificationDetails(
      android: AndroidNotificationDetails(
        _notificationChannelId,
        _notificationChannelName,
        icon: _androidNotificationIcon,
        importance: Importance.high,
        priority: Priority.high,
      ),
    ),
  );
}
