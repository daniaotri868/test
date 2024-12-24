import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';

class SavedItem extends StatelessWidget {
  const SavedItem(
      {super.key, required this.image, required this.title, this.subTitle});

  final String image;
  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(bottom: 22, top: 22, start: 24),
      child: Row(
        children: [
          AppImage.asset(
            image,
            size: 70,
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodyBold(title),
                if (subTitle != null) 14.verticalSpace,
                if (subTitle != null)
                  AppText.footnoteLight(
                    subTitle!,
                    textDirection: TextDirection.rtl,
                  ),
              ],
            ),
          ),
          8.horizontalSpace,
        ],
      ),
    );
  }
}
