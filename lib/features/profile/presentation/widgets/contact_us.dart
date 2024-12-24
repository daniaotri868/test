import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key, required this.icon, required this.link});
    final String icon;
    final String link;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsetsDirectional.only(start: 18,top: 12,bottom: 12),
      width: double.infinity,
      height: 50.h,
      decoration: BoxDecoration(
borderRadius: BorderRadius.circular(70.r),
        color: context.colorScheme.textFieldColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage.asset(icon),
          18.horizontalSpace,
          AppText.labelSmall(
            link,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
