import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import '../../features/order/presentation/pages/order_details_page.dart';
import '../../features/profile/presentation/pages/my_coupon.dart';
import '../navigation/router.dart';

class LocalNotificationService {
  static final _localNotificationPlugin = FlutterLocalNotificationsPlugin();

  static FlutterLocalNotificationsPlugin get localNotificationPlugin =>
      _localNotificationPlugin;

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_notification');

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    _localNotificationPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await _localNotificationPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: _onSelectNotification,
      onDidReceiveNotificationResponse: _onSelectNotification,
    );
  }

  static void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id ,title $title,body $body,payload $payload');
  }

  static Future<void> showNotificationWithPayload(RemoteMessage message) async {
    try {
      String title = message.notification?.title ?? 'New Notification';
      String body = message.notification?.body ?? 'You have a new notification';
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails('channelId', 'channelName',
              importance: Importance.max, priority: Priority.high);
      const NotificationDetails notificationDetails =
          NotificationDetails(android: androidDetails);
      String payload = jsonEncode(message.data);
      await _localNotificationPlugin.show(
          message.hashCode, title, body, notificationDetails,
          payload: payload);
    } catch (e) {
      print("Error displaying notification: $e");
    }
  }

  static void _onSelectNotification(NotificationResponse notificationResponse) {
    if (notificationResponse.payload != null &&
        (notificationResponse.payload?.isNotEmpty ?? false)) {
      Map<String, dynamic> data = jsonDecode(notificationResponse.payload!);
      String root =
          data['type'] == 'Coupon' ? MyCoupon.name : OrderDetailsPage.name;
      rootNavigatorKey.currentState?.context.goNamed(root, extra: data['Id']);
    }
  }

  _notificationDetails() {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      DateTime.now().toString(),
      DateTime.now().toString(),
      channelDescription: "all",
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
      styleInformation: const BigTextStyleInformation(''),
      icon: '@drawable/ic_notification',
    );
    DarwinNotificationDetails iosNotificationDetails =
        const DarwinNotificationDetails(
            // sound: sound,
            presentAlert: true,
            presentBadge: true,
            presentSound: true);

    return NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }
}
