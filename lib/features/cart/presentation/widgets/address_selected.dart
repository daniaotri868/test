import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_text.dart';

class AddressSelected extends StatelessWidget {
  const AddressSelected({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: REdgeInsetsDirectional.only(start: 22, end: 22, bottom: 22),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Icon(
            Icons.check_circle,
            color: context.colorScheme.secondary,
            size: 20,
          ),
          3.horizontalSpace,
          Expanded(
            child: AppText.paragraphMedium(
              textAlign: TextAlign.right,
              maxLines: 2,
              S.of(context).The_location_has_been_selected,
              color: context.colorScheme.secondary,
            ),
          ),
        ],
      ),
    ));
  }
}
