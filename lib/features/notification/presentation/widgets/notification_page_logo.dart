
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../app/presentation/widgets/app_image.dart';

class NotificationPageLogo extends StatelessWidget {
  const NotificationPageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: AlignmentDirectional.topEnd,
            margin:  EdgeInsetsDirectional.only(end: 19.w, top: 47.h),
            child: AppImage.asset(Assets.images.appLogo.path,
                height: 43.h, width: 43.w));
  }
}