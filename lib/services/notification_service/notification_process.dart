import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../firebase_options.dart';
import 'local_notification_service.dart';

class NotificationProcess {
  static NotificationProcess? _instance;
  NotificationProcess._singleton();
  factory NotificationProcess() =>
      _instance ??= NotificationProcess._singleton();
  // 1
  static Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
    print("${message.notification!.body}");
  }

  // 2
  void onMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      print("onMessage --------------------------------------------------");
      print("event.notification.body ${message.notification?.body}");
      print("event.notification.title ${message.notification?.title}");
      print("event.data ${message.data.toString()}");
      LocalNotificationService.showNotificationWithPayload(message);
    });
  }

  // 3
  Future<void> init() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform, name: "resturant");
      await requestPermission();
      if (Platform.isAndroid) {
        FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
      }
      log("FCM_TOKEN: ${await fcmToken}");
      await LocalNotificationService.initialize();
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: false, badge: true, sound: true);
      FirebaseMessaging.onBackgroundMessage(
          NotificationProcess.firebaseMessagingBackgroundHandler);
      onMessage();
    } catch (e) {
      rethrow;
    }
  }

  // 4
  requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    // if (Platform.isIOS || Platform.isMacOS) {}
    NotificationSettings settings = await messaging.requestPermission(
        alert: false,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    print(settings);
    //
  }

  Future<String> get fcmToken async =>
      await FirebaseMessaging.instance.getToken() ?? '';
  void onRefreshToken({required Function(String fcmToken) onRefresh}) {
    FirebaseMessaging.instance.onTokenRefresh.listen(onRefresh);
  }

  Future<void> deleteToken() async {
    await FirebaseMessaging.instance.deleteToken();
  }
}
