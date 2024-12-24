import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/price_with_currency.dart';

import '../../../../core/config/theme/app_theme.dart';
import '../../../app/presentation/widgets/app_text.dart';

class RowCartPrice extends StatelessWidget {
  final String firstText;
  final num? lastText;
  final bool isLastRow;
  final bool isFirstRow;

  const RowCartPrice({
    super.key,
    required this.firstText,
    required this.lastText,
    this.isLastRow = false,
    this.isFirstRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return lastText != null
        ? Column(
            children: [
              isLastRow
                  ? 7.verticalSpace
                  : isFirstRow
                      ? 0.verticalSpace
                      : 24.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.labelRegular(
                    firstText,
                    color: context.colorScheme.onSecondary,
                  ),
                  12.horizontalSpace,
                  PriceWithCurrency(
                    price: lastText!,
                    style: textTheme.label.bold,
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                ],
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
