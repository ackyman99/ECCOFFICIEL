import 'package:eccofficiel/screens/Programme/event/models/event_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class EventService {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  Future<void>? _initFuture;

  Future<void> initNotifications() async {
    if (_initialized) return;
    if (_initFuture != null) {
      await _initFuture;
      return;
    }
    _initFuture = () async {
      const settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      );
      await _notifications.initialize(settings: settings);
      final androidPlugin = _notifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      try {
        await androidPlugin?.requestNotificationsPermission();
      } on PlatformException catch (e) {
        if (e.code != 'permissionRequestInProgress') {
          rethrow;
        }
      }
      try {
        await _notifications
            .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(alert: true, badge: true, sound: true);
      } on PlatformException catch (e) {
        if (e.code != 'permissionRequestInProgress') {
          rethrow;
        }
      }
      _initialized = true;
    }();
    await _initFuture;
  }

  Future<void> scheduleReminder(EventModel event) async {
    if (!_initialized) {
      await initNotifications();
    }
    final scheduleTime = event.startDate.subtract(const Duration(minutes: 2));
    if (scheduleTime.isBefore(DateTime.now())) return;
    await _notifications.zonedSchedule(
      id: event.id,
      title: "Rappel : ${event.title}",
      body: "L'événement commence dans 2 minutes !",
      scheduledDate: tz.TZDateTime.from(scheduleTime, tz.local),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails('ch_id', 'Events', importance: Importance.max),
        iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> scheduleTestNotification() async {
    if (!_initialized) {
      await initNotifications();
    }
    await _notifications.zonedSchedule(
      id: 9999,
      title: "Test de notification",
      body: "Notification de test",
      scheduledDate: tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails('ch_id', 'Events', importance: Importance.max),
        iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  Future<void> showImmediateTestNotification() async {
    if (!_initialized) {
      await initNotifications();
    }
    await _notifications.show(
      id: 10000,
      title: "Test immédiat",
      body: "Notification immédiate (show)",
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails('ch_id', 'Events', importance: Importance.max),
        iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
      ),
    );
  }

  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    if (!_initialized) {
      await initNotifications();
    }
    return _notifications.pendingNotificationRequests();
  }

  Future<void> cancelAllPending() async {
    if (!_initialized) {
      await initNotifications();
    }
    final pending = await _notifications.pendingNotificationRequests();
    for (final p in pending) {
      await _notifications.cancel(id: p.id);
    }
  }

  Future<void> scheduleTestNotificationInSec(int seconds) async {
    if (!_initialized) {
      await initNotifications();
    }
    await _notifications.zonedSchedule(
      id: 10001,
      title: "Test +${seconds}s",
      body: "Notification reprogrammée à +${seconds}s",
      scheduledDate: tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails('ch_id', 'Events', importance: Importance.max),
        iOS: DarwinNotificationDetails(presentAlert: true, presentSound: true),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
