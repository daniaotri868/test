import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import '../../features/order/presentation/pages/order_details_page.dart';
import '../../features/profile/presentation/pages/my_coupon.dart';

class NotificationHandler {
  static void initialize(BuildContext context) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['type'] != null) {
        String root = message.data['type'] == 'Coupon'
            ? MyCoupon.name
            : OrderDetailsPage.name;
        context.goNamed(root, extra: message.data['Id']);
      }
    });
  }
}
