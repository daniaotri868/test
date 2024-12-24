import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/mobile/cart_page_mobile.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import 'package:restaurant_customer/features/home/presentaion/widget/product_item.dart';

import '../../../app/presentation/widgets/app_text.dart';
import '../../../category/presentaion/pages/details_product.dart';
import '../../data/models/product_item_model.dart';

class SectionProductHome extends StatelessWidget {
  final String title;
  final bool withBorder;
  final List<Product> listProduct;
   const SectionProductHome({super.key,required this.title, this.withBorder=false, required this.listProduct});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText.titleMedium(title,textAlign: TextAlign.start,),
        RSizedBox(
          height: 220,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>  ProductItem(withBorder: withBorder,item: listProduct[index], onTap: () {
                context.pushNamed(DetailsProduct.name,extra: listProduct[index].id??"");
              },),
              separatorBuilder: (context, index) => 7.horizontalSpace,
              itemCount: listProduct.length??0),
        ),
      ],
    );
  }
}
