import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../cart/data/model/extra_item.dart';

class ExtraItemWidget extends StatefulWidget {
  final ExtraItemModel item;
  final bool selected;
  final Function() onChange;
  final Function() add;
  final Function() minus;
  const ExtraItemWidget({super.key, required this.item,  this.selected=false, required this.onChange, required this.add, required this.minus});

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
                  value:widget.item.selected, onChanged:(value) {
                  widget.onChange();
                },
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    AppText(widget.item.name!??"",overflow: TextOverflow.ellipsis, maxLines: 1,),
                    AppText(widget.item.price.toString()??"").copyWith(color: context.colorScheme.secondary)
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
                onTap:widget.add,
                child:  CircleAvatar(
                  radius: 12,
                  backgroundColor: context.colorScheme.backGroundIcon,
                  child: const Center(
                    child: Icon(Icons.add,size: 10,),
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
                    child: Icon(Icons.remove,size: 10,),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }}
