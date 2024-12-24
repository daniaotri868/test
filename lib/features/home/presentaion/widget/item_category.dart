import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import '../../../app/presentation/widgets/app_text.dart';
import '../../data/models/category_section_model.dart';

class ItemCategory extends StatelessWidget {
  VoidCallback onTap;
  final CategoriesItem item;
  bool selected;
   ItemCategory({super.key,required this.onTap,this.selected=false, required this.item});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 17,right: 17),
        height: 52.h,
        decoration: BoxDecoration(
            color: context.colorScheme.categoryColor,
            borderRadius: BorderRadius.circular(9),
             border: Border.all(color:selected? context.colorScheme.primary:context.colorScheme.categoryColor,width: 2)
        ),
        child: Center(child: AppText(item.name??"")),
      ),
    );
  }
}
