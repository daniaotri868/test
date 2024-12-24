import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorWidgetPage extends StatelessWidget {
  final VoidCallback onPressed;
  const ErrorWidgetPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed:onPressed,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
