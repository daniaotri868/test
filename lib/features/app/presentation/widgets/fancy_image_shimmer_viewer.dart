import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_customer/core/config/api_routes.dart';

import '../../../../core/config/theme/extension.dart';

class FancyImageShimmerViewer extends StatelessWidget {
  const FancyImageShimmerViewer({
    Key? key,
    required this.imageUrl,
    this.errorWidget,
    this.width = 0,
    this.height = 0,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String imageUrl;
  final Widget? errorWidget;
  final BoxFit fit;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: ApiRoutes.baseImage + imageUrl,
      errorWidget: errorWidget ??
          Container(
            color: context.colorScheme.primary.withOpacity(0.2),
            child: const Icon(
              Icons.image_not_supported,
              size: 33,
            ),
          ),
      boxFit: fit,
      height: height!,
      width: width!,
    );
  }
}
