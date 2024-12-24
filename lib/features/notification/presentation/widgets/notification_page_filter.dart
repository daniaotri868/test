import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';

class NotificationPageFilter extends StatelessWidget {
  const NotificationPageFilter({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: context.colorScheme.primary.withOpacity(0.06),
              borderRadius: BorderRadius.circular(8.r)),
          width: 64.w,
          height: 32.h,
          margin:
              EdgeInsetsDirectional.only(start: 22.w, top: 8.h, bottom: 21.h),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            AppImage.asset(Assets.icons.filter,
                color: context.colorScheme.primary, height: 10.h, width: 10.w),
            9.horizontalSpace,
            AppText.labelSmall(S.of(context).Filter,
                fontWeight: FontWeight.w700, color: context.colorScheme.primary)
          ])),
    );
  }
}
