import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/firebase_options.dart';
import 'package:restaurant_customer/services/service_locator.dart';
import 'package:restaurant_customer/services/storage_service/storage_service.dart';

import 'app.dart';
import 'services/notification_service/local_notification_service.dart';
import 'services/notification_service/notification_process.dart';
//import 'package:awesome_notifications/awesome_notifications.dart';

// https://gitlab.com/sadekbadawi1998/restaurant-customer/-/tree/notification?ref_type=heads
FutureOr<void> main() async {
  await initializeApp();
  runApp(const App());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationProcess().init();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, name: "resturant");
  await configureDependencies();
  await ScreenUtil.ensureScreenSize();
  await HiveService.initialHive();
}
