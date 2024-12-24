import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/common/models/page_state/page_state.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/helper/helper_function.dart';
import 'package:restaurant_customer/features/cart/data/model/cart_model.dart';
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/mobile/cart_page_mobile.dart';
import 'package:collection/collection.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../services/service_locator.dart';
import '../../../app/data/repositories/prefs_repository_impl.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/fancy_image_shimmer_viewer.dart';
import '../../../cart/domain/use_case/add_to_cart_usecase.dart';
import '../../data/models/product_item_model.dart';

class ProductItem extends StatefulWidget {
  final bool withBorder;
  final Product item;
  final VoidCallback onTap;
  const ProductItem({
    Key? key,
    this.withBorder = false,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(.05),
                    )
                  ],
                  borderRadius: BorderRadius.circular(23.r),
                  border: Border.all(
                      color: widget.withBorder
                          ? context.colorScheme.errorContainer
                          : context.colorScheme.onPrimary,
                      width: 2),
                  color: context.colorScheme.onPrimary),
              width: 160.w,
              child: Padding(
                padding: REdgeInsetsDirectional.only(end: 10, start: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText.bodyLarge(widget.item.name??"",maxLines: 1,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:() async {
                            final token = await StorageRepositoryImpl().token;
                            token!=null?

                            context.read<CartBloc>().add(AddToCartEvent(params:AddToCartParams(
                                id: widget.item.id??"",
                                quantity: 1,
                                list: []
                            ) ,
                              onSuccess: () {
                                addToCart(widget.item.id??"",context);
                              },)):
                            HelperFunctions.flutterToast(S.current.You_must_log_in, context.colorScheme.error);
                          },
                          child: CircleAvatar(
                            backgroundColor: context.colorScheme.primary,
                            child: const Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        AppText((widget.item.price ?? 0).toString())
                            .copyWith(color: context.colorScheme.secondary)
                      ],
                    ),
                    10.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 160.w / 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: FancyImageShimmerViewer(
                imageUrl: widget.item.image ?? "",
                width: 126.h,
                height: 126.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Function? addToCart(String id, BuildContext context) {
  CartItemModel? item =
      (context.read<CartBloc>().state.getCartState.getDataWhenSuccess?.items ??
              [])
          .firstWhereOrNull(
    (element) => element.productId == id,
  );
  if (item == null) {
    Fluttertoast.showToast(
      msg: S.current.successfully_added,
      backgroundColor: context.colorScheme.primary,
      textColor: context.colorScheme.onPrimary,
      gravity: ToastGravity.BOTTOM,
    );
    context.read<CartBloc>().add(ToggleItemCartEvent(id: id));
  } else {
    Fluttertoast.showToast(
      msg: S.current.number_increased,
      backgroundColor: context.colorScheme.primary,
      textColor: context.colorScheme.onPrimary,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
