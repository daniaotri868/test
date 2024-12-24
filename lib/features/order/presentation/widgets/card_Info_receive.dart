import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/core/utils/extensions/box_shadow.dart';

import '../../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_text.dart';

class CardInfoReceive extends StatelessWidget {
   const CardInfoReceive({super.key, required this.customerName, required this.customerPhoneNumber});
  final String customerName;
   final String customerPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.offWhiteColor,
         boxShadow: [context.getBoxShadow1],
        borderRadius: BorderRadius.circular(10)
      ),

      child: RPadding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: context.colorScheme.primary.withOpacity(0.30),
                  size: 27,
                ),
                11.horizontalSpace,
                AppText.paragraphRegular(
                  S.of(context).Recipient_info,
                  color: context.colorScheme.primary,
                ),
              ],
            ),
            6.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.ratingNumber( S.of(context).Name),
                AppText.ratingNumber(customerName)
              ],
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.ratingNumber( S.of(context).Phone),
                AppText.ratingNumber(customerPhoneNumber)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
