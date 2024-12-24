import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../category/presentaion/pages/product_category.dart';
import '../../data/models/category_section_model.dart';
import 'item_category.dart';

class SectionCategory extends StatelessWidget {
  final List<CategoriesItem> listCategory;
  const SectionCategory({super.key, required this.listCategory});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 52.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) => ItemCategory(onTap: () {
                context.pushNamed(ProductCategory.name,extra:  listCategory[index].id??"");
              },item: listCategory[index],),
              separatorBuilder: (context, index) => 11.horizontalSpace,
              itemCount: listCategory.length??0),
        ),
      ],
    );
  }
}
