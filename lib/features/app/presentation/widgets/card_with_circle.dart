import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/circle_image.dart';

import 'app_text.dart';

class CardWithCircle extends StatelessWidget {
  final Color? backgroundColor;
  final String? image;
  final Color? borderColor;
  final double height;

  final Widget? topCenterWidget;

  final String? topCircleText;

  final String title;
  final Widget titleBottom;
  final String? subTitle;
  final Color? subTitleColor;
  final Widget? trailingTop;
  final String? trailingTopText;
  final Widget trailingBottom;

  final double? verticalSpace;
  final FontWeight? fontWeightTitle;

  const CardWithCircle(
      {super.key,
      this.subTitleColor,
      this.topCenterWidget,
      this.backgroundColor,
      this.verticalSpace,
      this.fontWeightTitle,
      this.trailingTopText,
      required this.title,
      this.subTitle,
      required this.titleBottom,
      this.trailingTop,
      required this.trailingBottom,
      required this.height,
      this.image,
      this.topCircleText,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                color: context.colorScheme.backgroundColor,
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(color: context.colorScheme.border, width: 1)),
            margin: REdgeInsetsDirectional.only(start: (height / 2).w),
          ),
        ),
        Row(
          children: [
            CircleImage(
              height: height,
              topCircleText: topCircleText,
              image: image!,
            ),
            7.horizontalSpace,
            Expanded(
              child: Padding(
                padding:
                    REdgeInsetsDirectional.only(top: 11, end: 15, bottom: 11),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AppText.label(
                              title,
                              fontWeight: fontWeightTitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          8.horizontalSpace,
                          trailingTopText != null
                              ? AppText.ratingNumber(
                                  trailingTopText!,
                                  color: context.colorScheme.onSecondary,
                                  fontWeight: FontWeight.w500,
                                )
                              : trailingTop != null
                                  ? trailingTop!
                                  : const SizedBox.shrink(),
                        ],
                      ),
                      if (subTitle != null)
                        AppText.footnoteRegular(
                          subTitle!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          color: subTitleColor ?? context.colorScheme.primary,
                        ),
                      if (topCenterWidget != null) topCenterWidget!,
                      verticalSpace?.verticalSpace ?? 0.verticalSpace,
                      Row(
                        children: [
                          titleBottom,
                          7.horizontalSpace,
                          trailingBottom
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
