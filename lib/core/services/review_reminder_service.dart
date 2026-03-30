import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nim2book_mobile_flutter/core/database/database.dart';
import 'package:nim2book_mobile_flutter/core/services/dictionary_service.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:workmanager/workmanager.dart';

const _checkDueCardsTaskName = 'check_due_cards_task';
const _checkDueCardsUniqueWorkName = 'check_due_cards_unique_work';
const _checkInterval = Duration(minutes: 10);

const _notificationChannelId = 'review_reminders';
const _notificationChannelName = 'Review reminders';
const _notificationChannelDescription =
    'Reminders when there are cards due for review';
const _notificationId = 1001;

final FlutterLocalNotificationsPlugin _notificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
void reviewReminderCallbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();

    if (task != _checkDueCardsTaskName) {
      return true;
    }

    try {
      final service = _createBackgroundReviewReminderService();
      await service.runScheduledCheck();
    } catch (e, st) {
      debugPrint('Background review reminder failed: $e');
      debugPrint(st.toString());
    } finally {
      await ReviewReminderService.scheduleNextCheck();
    }

    return true;
  });
}

ReviewReminderService _createBackgroundReviewReminderService() {
  final talker = TalkerFlutter.init();
  final dictionaryService = DictionaryService.background(talker, Database());

  return ReviewReminderService(
    logger: talker,
    dictionaryService: dictionaryService,
  );
}

class ReviewReminderService {
  final Talker _logger;
  final DictionaryService _dictionaryService;

  const ReviewReminderService({
    required Talker logger,
    required DictionaryService dictionaryService,
  }) : _logger = logger,
       _dictionaryService = dictionaryService;

  Future<void> initialize() async {
    await _initializeLocalNotifications();

    if (kIsWeb) {
      _logger.debug('Review reminders are not supported on web');
      return;
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      await Workmanager().initialize(reviewReminderCallbackDispatcher);
      await scheduleNextCheck(replaceExisting: true);
      _logger.debug('Review reminders initialized on Android');
      return;
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      // todo: iOS implementation
      _logger.debug('Review reminders are not implemented on iOS yet');
      return;
    }
  }

  Future<void> runScheduledCheck() async {
    final dueCardsCount = await _dictionaryService.getDueCardsCount();

    _logger.debug('Review reminder check: due=$dueCardsCount');

    if (dueCardsCount > 0) {
      await _showReviewReminderNotification(dueCardsCount);
    }
  }

  static Future<void> scheduleNextCheck({bool replaceExisting = false}) async {
    await Workmanager().registerOneOffTask(
      _checkDueCardsUniqueWorkName,
      _checkDueCardsTaskName,
      initialDelay: _checkInterval,
      constraints: Constraints(networkType: NetworkType.notRequired),
      existingWorkPolicy: replaceExisting
          ? ExistingWorkPolicy.replace
          : ExistingWorkPolicy.keep,
    );
  }

  Future<void> _initializeLocalNotifications() async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
    );

    await _notificationsPlugin.initialize(settings);

    final androidImplementation = _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidImplementation?.requestNotificationsPermission();

    await androidImplementation?.createNotificationChannel(
      const AndroidNotificationChannel(
        _notificationChannelId,
        _notificationChannelName,
        description: _notificationChannelDescription,
        importance: Importance.high,
      ),
    );
  }

  Future<void> _showReviewReminderNotification(int dueCardsCount) async {
    await _initializeLocalNotifications();

    await _notificationsPlugin.show(
      _notificationId,
      'Nim2Book: время повторения',
      'Можно повторить $dueCardsCount слов. Вернитесь в приложение Nim2Book.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _notificationChannelId,
          _notificationChannelName,
          channelDescription: _notificationChannelDescription,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }
}
