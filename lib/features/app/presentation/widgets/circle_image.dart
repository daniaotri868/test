import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import 'app_text.dart';
import 'fancy_image_shimmer_viewer.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(
      {super.key,
      required this.height,
      required this.image,
      this.topCircleText});

  final double height;

  final String image;
  final String? topCircleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Positioned.fill(
              child: FancyImageShimmerViewer(
            imageUrl: image,
          )),
          if (topCircleText != null)
            Container(
              color: context.colorScheme.primary.withOpacity(0.7),
              width: 1.sw,
              padding: REdgeInsets.symmetric(horizontal: (height * 0.26).w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.bodySemiBold(
                    "+",
                    figmaLineHeight: 30,
                    fontWeight: FontWeight.w600,
                    textDirection: TextDirection.ltr,
                    color: context.colorScheme.surface,
                  ),
                  Flexible(
                    child: AppText.bodySemiBold(
                      topCircleText!,
                      figmaLineHeight: 30,
                      fontWeight: FontWeight.w600,
                      maxLines: 1,
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      color: context.colorScheme.surface,
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
