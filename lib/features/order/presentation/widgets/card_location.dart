import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/core/utils/extensions/box_shadow.dart';

import '../../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../data/models/order_details_model.dart';

class CardLocation extends StatelessWidget {
  const CardLocation({super.key, required this.address});
  final Address address;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: context.colorScheme.primary.withOpacity(0.30),
                  size: 27,
                ),
                11.horizontalSpace,
                AppText.paragraphRegular(
                  S.of(context).Arrive_to,
                  color: context.colorScheme.primary,
                ),
              ],
            ),
            6.verticalSpace,
            AppText.labelSemiBold(address.city!),
            15.verticalSpace,
            AppText(address.addressDetail!),
          ],
        ),
      ),
    );
  }
}
