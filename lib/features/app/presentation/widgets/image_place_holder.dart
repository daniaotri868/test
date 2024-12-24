import 'package:flutter/material.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:shimmer/shimmer.dart';

import 'app_image.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.brandAccent.shade100,
      highlightColor: Colors.grey.shade100,
      child: Center(
        child: AppImage.asset(
          'assets/icons/humy.svg',
          width: width,
          // height: height*.7,
        ),
      ),
    );
  }
}
