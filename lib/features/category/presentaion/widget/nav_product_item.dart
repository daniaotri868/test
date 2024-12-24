import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/app_theme.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import 'package:restaurant_customer/features/home/presentaion/widget/product_item.dart';

import '../../../../core/helper/helper_function.dart';
import '../../../../generated/l10n.dart';
import '../../../app/data/repositories/prefs_repository_impl.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../cart/domain/use_case/add_to_cart_usecase.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../data/models/details_product_model.dart';

class NavProductItem extends StatefulWidget {
  final DetailsProductModel data;

  const NavProductItem({super.key, required this.data});

  @override
  State<NavProductItem> createState() => _NavProductItemState();
}

class _NavProductItemState extends State<NavProductItem> {
  @override
  int count=1;

  Widget build(BuildContext context) {
    return  RSizedBox(
      height: 127,
      child: Padding(
        padding:REdgeInsetsDirectional.only(start: 17,end: 17,bottom: 0),
        child: Column(
          children: [
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.titleMedium((widget.data.price??0).toString()).copyWith(color: context.colorScheme.secondary),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                      child:  CircleAvatar(
                        backgroundColor: context.colorScheme.backGroundIcon,
                        child: const Center(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                    16.horizontalSpace,
                    AppText.titleMedium(count.toString()),
                    16.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(count>1)count--;
                        });
                      },
                      child:  CircleAvatar(
                        backgroundColor: context.colorScheme.backGroundIcon,
                        child: const Center(
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            13.verticalSpace,
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return AppButton.dark(
                  isLoading: state.addToCart.isLoading(),
                  fixedSize: Size(400.w, 50.h),
                  child: AppText(S.current.add_to_cart),
                  onPressed: () async{
                    final token = await StorageRepositoryImpl().token;
                    token!=null?
                    context.read<CartBloc>().add(AddToCartEvent(params:AddToCartParams(
                        id: widget.data.id??"",
                        quantity: count,
                        list: widget.data.extraItem??[]

                    ) ,
                      onSuccess: () {
                        addToCart(widget.data.id??"",context,);
                      },)):   HelperFunctions.flutterToast(S.current.You_must_log_in, context.colorScheme.error);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
