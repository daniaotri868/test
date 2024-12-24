import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/price_with_currency.dart';
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart';

import '../../../../core/config/theme/app_theme.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../app/presentation/widgets/card_with_circle.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../data/model/cart_model.dart';
import 'display_extra_item.dart';

class CartItem extends StatefulWidget {
  final int itemCount;
  final int index;
  final CartItemModel item;

  const CartItem(
      {super.key,
      required this.itemCount,
      required this.index,
      required this.item});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late final CartBloc cartBloc;

  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }

  bool isAllow = true;

  final _debouncer = Debouncer(seconds: 5);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
        bottom: widget.itemCount - 1 == widget.index ? 0 : 10,
      ),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.colorScheme.errorContainer,
          ),
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: REdgeInsetsDirectional.only(end: 15.w),
              child: AppImage.asset(
                Assets.icons.delete,
                size: 20,
              ),
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          cartBloc.add(RemoveItemEvent(
              id: widget.item.id,
              storeId: null,
              isAddSequential:
                  _debouncer.isActiveTimer() == true ? null : true));
          _debouncer.cancelTimer();
        },
        child: CardWithCircle(
          title: widget.item.name!,
          topCenterWidget: RSizedBox(
            height: 32,
            child: widget.item.extraItems!.isNotEmpty
                ? DisplayExtraItem(
                    extraItem: widget.item.extraItems!,
                    itemId: widget.item.id ?? "",
                  )
                : null,
          ),
          trailingBottom: Row(children: [
            InkWell(
              child: AppImage.asset(Assets.icons.add),
              onTap: () {
                context.read<CartBloc>().add(UpdateCartLocalEvent(
                    itemId: widget.item.id,
                    isIncrement: true,
                    isAddSequential:
                        _debouncer.isActiveTimer() == true ? null : true));

                _debouncer.run(
                  () => cartBloc
                      .add(UpdateCartEvent(id: widget.item.id, storeId: null)),
                );
              },
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 14),
              child: AppText.labelRegular(widget.item.quantity.toString()),
            ),
            GestureDetector(
              onTap: widget.item.quantity != 1
                  ? () {
                      cartBloc.add(UpdateCartLocalEvent(
                          itemId: widget.item.id,
                          isIncrement: false,
                          isAddSequential: _debouncer.isActiveTimer() == true
                              ? null
                              : true));

                      _debouncer.run(
                        () => context.read<CartBloc>().add(
                            UpdateCartEvent(id: widget.item.id, storeId: null)),
                      );
                    }
                  : null,
              child: AppImage.asset(Assets.icons.minus),
            )
          ]),
          titleBottom: PriceWithCurrency(
            mainAxisAlignment: MainAxisAlignment.start,
            style: textTheme.footnote.regular,
            price: widget.item.price! * widget.item.quantity!,
          ),
          height: 106.h,
          borderColor: context.colorScheme.borderColor,
          image: widget.item.image!,
          backgroundColor: context.colorScheme.backgroundColor,
        ),
      ),
    );
  }
}

class Debouncer {
  final int seconds;
  Timer? _timer;

  Debouncer({required this.seconds});

  void cancelTimer() {
    _timer?.cancel();
  }

  bool isActiveTimer() {
    return _timer?.isActive ?? false;
  }

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(seconds: seconds), action);
  }
}
