import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/card_with_circle.dart';
import 'package:restaurant_customer/features/order/data/models/order_details_model.dart';
import 'package:restaurant_customer/features/order/presentation/widgets/text_extra_item.dart';
import 'package:restaurant_customer/features/order/presentation/widgets/text_quantity.dart';
import 'package:restaurant_customer/generated/flutter_gen/assets.gen.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/price_with_currency.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return CardWithCircle(
      title: item.name!,
      trailingTop: AppImage.asset(
        Assets.icons.close,
        width: 20,
        height: 20,
      ),
      topCenterWidget: RSizedBox(
        height: 30,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Row(
                  children: [
                    TextExtraItem(
                      text: item.extraItems![index].name!,
                    ),
                    1.horizontalSpace,
                    TextExtraItem(
                        text: "(${item.extraItems![index].quantity})"),
                  ],
                ),
            separatorBuilder: (context, index) => const Align(
                  alignment: Alignment.center,
                  child: TextExtraItem(
                    text: ' - ',
                  ),
                ),
            itemCount: item.extraItems!.length),
      ),
      trailingBottom: PriceWithCurrency(
        mainAxisAlignment: MainAxisAlignment.end,
        style: textTheme.footnote.medium,
        price: item.price!,
        color: context.colorScheme.underlineTextColor,
      ),
      fontWeightTitle: FontWeight.w400,
      titleBottom: Row(
        children: [
          TextQuantity(
            text: S.of(context).Count,
          ),
          2.horizontalSpace,
          TextQuantity(
            text: item.quantity.toString(),
          ),
        ],
      ),
      height: 105.h,
      backgroundColor: context.colorScheme.containerColor,
      borderColor: context.colorScheme.borderColor,
      image: item.image,
    );
  }
}
