import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/fancy_image_shimmer_viewer.dart';
import '../../data/models/all_category_model.dart';
import '../../data/models/category_section_model.dart';

class ItemFood extends StatelessWidget {
  final CategoriesItem item;
  final   VoidCallback onTap;
  const ItemFood({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child:  FancyImageShimmerViewer(
              imageUrl:item.image??"",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
                padding: REdgeInsetsDirectional.only(bottom: 152/10),
                child: Center(child: AppText.bodyLarge(item.name??"").copyWith(color:context.colorScheme.onPrimary))),
          )
        ],
      ),
    );
  }
}
