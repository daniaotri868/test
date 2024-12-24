import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';

class NavLocationPage extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function()? onPressed;
  const NavLocationPage({Key? key, this.title, this.subTitle, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Padding(
        padding: REdgeInsetsDirectional.only(top: 20),
        child: Row(
          children: [
            24.horizontalSpace,
            const RSizedBox(
                width: 64,
                child: AppImage.asset('assets/icons/icon_marker.png')),
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText.bodyLarge(title ?? "",
                    color: Colors.black, fontWeight: FontWeight.w700),
                5.verticalSpace,
                SizedBox(
                    width: 200.w,
                    child: AppText(
                      textAlign: TextAlign.right,
                      subTitle ?? "",
                      color: Colors.black,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ))
              ],
            ),
            InkWell(
              onTap: onPressed,
              child: const RSizedBox(
                  width: 49, child: AppImage.asset('assets/icons/Shape.png')),
            ),
          ],
        ),
      ),
    );
  }
}
