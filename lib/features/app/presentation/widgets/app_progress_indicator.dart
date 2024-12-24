import 'package:flutter/material.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

class AppProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double size;
  final bool light;
  final Color? color;
  const AppProgressIndicator({
    super.key,
    double? strokeWidth,
    this.size = 25,
    this.light = false,
    this.color,
  }) : strokeWidth = strokeWidth ?? size / 13;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: color ?? context.colorScheme.primary,
          strokeWidth: strokeWidth,
          strokeCap: StrokeCap.round,
          backgroundColor: (light ? context.colorScheme.outline : context.colorScheme.brandAccent[300]),
        ),
      ),
    );
  }
}
