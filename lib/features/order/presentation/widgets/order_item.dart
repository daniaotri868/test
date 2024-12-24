import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/core/helper/helper_function.dart';
import 'package:restaurant_customer/features/order/domain/entities/order.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../app/presentation/widgets/card_with_circle.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/price_with_currency.dart';
import '../pages/order_details_page.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return CardWithCircle(
      verticalSpace: 9.h,
      topCircleText: order.itemCount.toString(),
      trailingTopText: HelperFunctions.formatDateTimeToLocal(order.date!),
      title: order.number,
      image: "",
      subTitle: order.status!.text,
      subTitleColor: order.status!.color,
      fontWeightTitle: FontWeight.w600,
      trailingBottom: AppButton(
          onPressed: () =>
              context.pushNamed(OrderDetailsPage.name, extra: order.id),
          buttonType: AppButtonType.ghost,
          child: AppText.paragraphSemiBold(
            S.current.Continue,
            style: TextStyle(
                color: context.colorScheme.underlineTextColor,
                decoration: TextDecoration.underline,
                decorationColor: context.colorScheme.underlineTextColor),
            fontWeight: FontWeight.w600,
          )),
      titleBottom: PriceWithCurrency(
        mainAxisAlignment: MainAxisAlignment.start,
        style: textTheme.footnote.regular,
        price: order.totalPrice!,
      ),
      height: 122.h,
      borderColor: context.colorScheme.outline,
    );
  }
}
