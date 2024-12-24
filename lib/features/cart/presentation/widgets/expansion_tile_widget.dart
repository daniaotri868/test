import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import '../../../app/presentation/widgets/app_text.dart';

class ExpansionTileWidget extends StatefulWidget {
  final List<ItemExpansionTile> items;
  final bool isShowBorder;

  final Widget leading;
  final String title;

  const ExpansionTileWidget(
      {super.key,
      this.isShowBorder = false,
      required this.title,
      required this.leading,
      required this.items});

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  Icon trailingIcon = const Icon(Icons.arrow_drop_down_sharp);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        setState(() {
          value
              ? trailingIcon = const Icon(Icons.arrow_drop_up)
              : const Icon(Icons.arrow_drop_down_sharp);
        });
      },
      leading: widget.leading,
      trailing: trailingIcon,
      title: AppText.titleSmall(
        widget.title,
        style: const TextStyle(fontSize: 16),
      ),
      childrenPadding:
          REdgeInsetsDirectional.only(bottom: 13, start: 20, end: 20),
      collapsedBackgroundColor: context.colorScheme.backgroundColor,
      collapsedIconColor: context.colorScheme.inverseSurface,
      backgroundColor: context.colorScheme.backgroundColor,
      iconColor: context.colorScheme.inverseSurface,
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: widget.isShowBorder
              ? BorderSide(color: context.colorScheme.error, width: 1.5)
              : BorderSide(color: context.colorScheme.backgroundColor)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: widget.isShowBorder
              ? BorderSide(color: context.colorScheme.error, width: 1.5)
              : BorderSide(color: context.colorScheme.backgroundColor)),
      children: widget.items
          .map((e) => InkWell(
                onTap: () => e.onTap?.call(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color:
                                  context.colorScheme.shadow.withOpacity(0.1),
                              width: 1),
                        ),
                      ),
                    ),
                    RPadding(
                      padding: const EdgeInsets.all(11.0),
                      child: AppText.labelMedium(e.text),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class ItemExpansionTile {
  final String text;
  final void Function()? onTap;

  ItemExpansionTile({required this.text, required this.onTap});
}
