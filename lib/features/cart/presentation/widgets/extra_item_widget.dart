import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/price_with_currency.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../data/model/extra_item.dart';

class ExtraItemWidget extends StatefulWidget {
  final ExtraItemModel item;
  final bool selected;
  final Function() onChange;
  final Function() add;
  final Function()? minus;

  const ExtraItemWidget(
      {super.key,
      required this.item,
      this.selected = false,
      required this.onChange,
      required this.add,
       this.minus});

  @override
  State<ExtraItemWidget> createState() => _ExtraItemWidgetState();
}

class _ExtraItemWidgetState extends State<ExtraItemWidget> {
  @override
  build(BuildContext context) {
    return Row(


      children: [
        Expanded(
          flex: 2,
          child: Row(

            children: [
              Expanded(
                child: Checkbox(
                  value: widget.item.selected,
                  onChanged: (value) {
                    widget.onChange();
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.labelMedium(
                      widget.item.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    PriceWithCurrency(
                      isFlexible: false,
                      price: widget.item.price * widget.item.quantity,
                      style:
                          textTheme.label.copyWith(fontWeight: FontWeight.w400),
                      mainAxisAlignment: MainAxisAlignment.start,
                      color: context.colorScheme.secondary,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        15.horizontalSpace,
        Expanded(
          child: Row(
            children: [
              GestureDetector(
                onTap: widget.add,
                child:  CircleAvatar(
                  radius: 12,
                  backgroundColor: context.colorScheme.backGroundIcon,
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      size: 10,
                    ),
                  ),
                ),
              ),
              12.horizontalSpace,
              AppText.titleSmall(widget.item.quantity.toString()),
              12.horizontalSpace,
              GestureDetector(
                onTap: widget.minus,
                child:  CircleAvatar(
                  radius: 12,
                  backgroundColor: context.colorScheme.backGroundIcon,
                  child: const Center(
                    child: Icon(
                      Icons.remove,
                      size: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
