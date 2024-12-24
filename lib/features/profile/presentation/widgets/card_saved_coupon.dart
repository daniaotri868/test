import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/generated/assets.dart';

import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';

class CardSavedCoupon extends StatelessWidget {
  const CardSavedCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsetsDirectional.only(start:23,end: 23,top: 10 ),
      padding: REdgeInsetsDirectional.only(start: 10,end: 10,top: 5,bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage.asset(
            Assets.imagesIconCoupon,
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'A2EES',
                  style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorScheme.shadow,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.close,color: context.colorScheme.error,size: 25.r,),
              40.verticalSpace,
              Icon(Icons.edit_sharp,color: context.colorScheme.primary,size: 25.r,),
            ],
          )
          // const Spacer(),
        ],
      ),
    );
  }
}
