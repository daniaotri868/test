import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_image.dart';
import 'package:restaurant_customer/features/profile/data/model/coupon_model.dart';

import '../../../../core/helper/helper_function.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_text.dart';

class CardDiscount extends StatefulWidget {
  final bool select;
  const CardDiscount(
      {super.key, required this.discountModel, this.select = false});
  final CouponModel  discountModel;

  @override
  State<CardDiscount> createState() => _CardDiscountState();
}

class _CardDiscountState extends State<CardDiscount> {
  late int value;
  String imgaePath = '';

  @override
  void initState() {
    if (widget.discountModel.precent == null) {
      value = widget.discountModel.value!;
      imgaePath = 'assets/images/coin.gif';
    } else {
      value = widget.discountModel.precent!;
      imgaePath = 'assets/svg/percent.svg';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsetsDirectional.only(
        top: 13,
        start: 10,
          end: 10
      ),
      child: Container(
        height: 150.h,

        padding: REdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 10.h,
        ),
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
          ],        ),
        child: Padding(
          padding: REdgeInsetsDirectional.only(bottom: 6.h),
          child: Row(
            children: [
              AppImage.asset(
                imgaePath,
                width: 40.w,
              ),
              15.horizontalSpace,
              DottedLine(
                direction: Axis.vertical,
                dashLength: 12.0,
                dashColor: context.colorScheme.outline,
                dashGapLength: 7.0,
                lineThickness: 2,
              ),
              20.horizontalSpace,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      widget.discountModel.code ?? "",
                      style: context.textTheme.titleLarge!.copyWith(
                          color: context.colorScheme.shadow,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    5.verticalSpace,
                    AppText(
                      widget.discountModel.name ?? "",
                      style: context.textTheme.titleMedium!.copyWith(
                        color: context.colorScheme.shadow,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    5.verticalSpace,
                    AppText(
                      HelperFunctions.formatPrice(value).toString(),
                      style: context.textTheme.titleMedium!.copyWith(
                        color: context.colorScheme.shadow,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    5.verticalSpace,
                    AppText(
                     S.current.ValidUntilTheEnd
                      ,
                      style: context.textTheme.titleSmall!.copyWith(
                        color: context.colorScheme.shadow.withOpacity(.5),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    12.verticalSpace,
                    AppText(
                     " ${HelperFunctions.formatDate(DateTime.parse(widget.discountModel.endDate??''))}"
                     ,
                      style: context.textTheme.titleSmall!.copyWith(
                        color: context.colorScheme.shadow.withOpacity(.5),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
