import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/app_theme.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/loading_widget.dart';

class CouponCancel extends StatelessWidget {
  const CouponCancel(
      {super.key,
      required this.code,
      required this.onCancel,
      required this.isLoading});

  final String code;
  final void Function() onCancel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: REdgeInsetsDirectional.only(start: 22, end: 22, bottom: 36),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: context.colorScheme.secondary,
            size: 20,
          ),
          3.horizontalSpace,
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 213.w),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: S.of(context).The_application_was_successful,
                  style: context.textTheme.paragraph
                      .copyWith(color: context.colorScheme.onSecondary)),
              TextSpan(
                  text: code,
                  style: context.textTheme.label.light
                      .copyWith(color: context.colorScheme.secondary))
            ])),
          ),
          10.horizontalSpace,
          Stack(
            children: [
              InkWell(
                onTap: () {
                  onCancel.call();
                },
                child: Container(
                  padding: REdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: context.colorScheme.error.withOpacity(0.1)),
                  child: Row(
                    children: [
                      AppImage.asset(
                        Assets.icons.delete,
                        color: context.colorScheme.error,
                        size: 16,
                      ),
                      2.horizontalSpace,
                      AppText.labelSmall(
                        S.of(context).Cancel_code,
                        style: TextStyle(
                            fontSize: 14, color: context.colorScheme.error),
                      ),
                    ],
                  ),
                ),
              ),
              isLoading
                  ? Positioned.fill(
                      child: Container(
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: context.colorScheme.shadow.withOpacity(0.2)),
                        child: const LoadingWidget(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    ));
  }
}
