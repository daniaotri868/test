import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  const AppDialog._({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    bool? barrierDismissible,
    String? routeName,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog<T>(
        context: context,
        builder: (BuildContext context) => AppDialog._(child: child),
        barrierDismissible: barrierDismissible ?? false,
        routeSettings: RouteSettings(name: routeName),
      );
    }
    return showDialog<T>(
      context: context,
      builder: (context) => AppDialog._(child: child),
      barrierDismissible: barrierDismissible ?? true,
      routeSettings: RouteSettings(name: routeName),
    );
  }

  @override
  State<AppDialog> createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
