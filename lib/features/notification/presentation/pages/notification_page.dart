import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../bloc/notification_bloc.dart';
import '../widgets/notification_page_list/notification_page_list.dart';
import '../widgets/notification_page_logo.dart';

class NotificationPage extends StatefulWidget {
  static String path = "/Notification";
  static String name = "/Notification";
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationBloc _notificationBloc = GetIt.I<NotificationBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: false,
        create: (_) => _notificationBloc,
        child: const Scaffold(
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          NotificationPageLogo(),
          NotificationPageList()
        ])));
  }
}
