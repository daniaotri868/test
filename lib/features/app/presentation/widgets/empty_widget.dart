import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import '../../../../generated/flutter_gen/assets.gen.dart';
import 'app_image.dart';
import 'app_text.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage.asset(
            Assets.icons.nodata,
            size: 200,
          ),
          10.verticalSpace,
          AppText(
            "لا يوجد بيانات",
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}