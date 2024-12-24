import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.backgroundColor,
    this.dimension,
  }) : super(key: key);

  final Color? backgroundColor;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension ?? 16.r,
      child: Platform.isAndroid
          ? Center(
            child: CircularProgressIndicator(
                backgroundColor: backgroundColor ?? context.theme.colorScheme.primary.withOpacity(0.6),
                strokeWidth: 1.8,
                valueColor: AlwaysStoppedAnimation<Color>(backgroundColor != null ? context.colorScheme.onSecondary : Colors.white70),
              ),
          )
          : Center(child: CupertinoActivityIndicator(color: backgroundColor ?? context.colorScheme.primary.withOpacity(0.6))),
    );
  }
}
