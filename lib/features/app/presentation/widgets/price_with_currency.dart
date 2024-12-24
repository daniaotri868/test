import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import '../../../../core/helper/helper_function.dart';
import '../../../../generated/l10n.dart';
import 'app_text.dart';

class PriceWithCurrency extends StatelessWidget {
  const PriceWithCurrency(
      {super.key,
      required this.price,
      this.color,
      required this.style,
      required this.mainAxisAlignment,
      this.isFlexible = true});

  final num price;
  final Color? color;
  final TextStyle? style;
  final MainAxisAlignment mainAxisAlignment;
  final bool isFlexible;

  @override
  Widget build(BuildContext context) {
    return isFlexible
        ? Flexible(
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: [
                Flexible(
                  child: AppText(
                    style: style,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    price.toString(),
                    color: color ?? context.colorScheme.shadow,
                  ),
                ),
                3.horizontalSpace,
                AppText(
                  style: style,
                  S.of(context).Currency,
                  color: color,
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Flexible(
                child: AppText.bodyMedium(
                  style: style,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  price.toString(),
                  color: color ?? context.colorScheme.shadow,
                ),
              ),
              3.horizontalSpace,
              AppText(
                style: style,
                S.of(context).Currency,
                color: color,
              ),
            ],
          );
  }
}
