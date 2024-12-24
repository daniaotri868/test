import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_button.dart';
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:restaurant_customer/features/cart/presentation/widgets/coupon_cancel.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import '../../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';
import '../../../../address/presentation/pages/location_page.dart';
import '../../../../app/presentation/widgets/animated_dialog.dart';
import '../../../../app/presentation/widgets/app_appbar.dart';
import '../../../../app/presentation/widgets/app_image.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/empty_widget.dart';
import '../../../../app/presentation/widgets/error_widget.dart';
import '../../../../app/presentation/widgets/loading_widget.dart';
import '../../widgets/add_coupon_dialog.dart';
import '../../widgets/address_selected.dart';
import '../../widgets/cart_item.dart';
import '../../widgets/expansion_tile_widget.dart';
import '../../widgets/row_cart_price.dart';
import 'package:dotted_border/dotted_border.dart';

import '../saved_coupon_page.dart';
import '../saved_address_page.dart';

class CartPageMobile extends StatefulWidget {
  const CartPageMobile({super.key});

  @override
  State<CartPageMobile> createState() => _CartPageMobileState();
}

class _CartPageMobileState extends State<CartPageMobile> {
  final ValueNotifier<bool> onPressedNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isShowBorderNotifier =
      ValueNotifier<bool>(false);

  late Timer timer;

  @override
  void initState() {
    context.read<CartBloc>().add(GetCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return ValueListenableBuilder(
        valueListenable: onPressedNotifier,
        builder: (context, value, child) => LoadingOverlay(
          isLoading: value,
          child: AppScaffold(
            appBar: AppAppBar(
                label: S.of(context).Cart, showDefaultBackButton: true),
            body: PageStateBuilder(
              init: const SizedBox.shrink(),
              success: (data) => RefreshIndicator(
                onRefresh: () async =>
                    context.read<CartBloc>().add(GetCartEvent()),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: REdgeInsetsDirectional.only(
                          start: 22, end: 22, bottom: 22, top: 13),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          addRepaintBoundaries: false,
                          (context, index) {
                            return CartItem(
                              index: index,
                              itemCount: data.items!.length,
                              item: data.items![index],
                            );
                          },
                          childCount: data.items!.length,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: ValueListenableBuilder(
                      valueListenable: isShowBorderNotifier,
                      builder: (context, value, child) => Padding(
                        padding: REdgeInsetsDirectional.only(
                            start: 22,
                            end: 22,
                            bottom: state.addressId == null ? 22 : 4),
                        child: ExpansionTileWidget(
                          title: S.of(context).Arrive_to,
                          isShowBorder: value,
                          items: [
                            ItemExpansionTile(
                              onTap: () {
                                context.pushNamed(SavedAddressPage.name);
                              },
                              text: S.of(context).Choose_a_saved_address,
                            ),
                            ItemExpansionTile(
                                text: S.of(context).Add_a_new_address,
                                onTap: () {
                                  context.pushNamed(LocationPage.name,extra: AddLocationPageParams(profileOrCart: false));

                                })
                          ],
                          leading: AppImage.asset(
                            Assets.icons.location,
                            size: 32,
                          ),
                        ),
                      ),
                    )),
                    if (state.addressId != null) const AddressSelected(),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: REdgeInsetsDirectional.only(
                            start: 22,
                            end: 22,
                            bottom: state.code == null || state.code == ''
                                ? 36
                                : 6),
                        child: ExpansionTileWidget(
                          title: S.of(context).Coupon_value,
                          items: [
                            ItemExpansionTile(
                              onTap: () =>
                                  context.pushNamed(SavedCouponPage.name),
                              text: S.of(context).Choose_a_saved_coupon,
                            ),
                            ItemExpansionTile(
                              onTap: () {
                                AnimatedDialog.show(
                                  context,
                                  child: AddCouponDialog(),
                                );
                              },
                              text: S.of(context).Add_a_new_coupon,
                            )
                          ],
                          leading: AppImage.asset(
                            Assets.icons.coupon,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                    if (state.code != null && state.code != '')
                      CouponCancel(
                          code: state.code!,
                          onCancel: () => context
                              .read<CartBloc>()
                              .add(ApplyCouponEvent(code: '')),
                          isLoading: state.applyCoupon.isLoading()),
                    SliverPadding(
                      padding: REdgeInsets.only(
                          top:
                              (1.sh - 780).isNegative || data.items!.length >= 2
                                  ? 0
                                  : 1.sh - 780),
                      sliver: SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: context.colorScheme.backgroundColor,
                          ),
                          padding: REdgeInsets.symmetric(
                              horizontal: 25, vertical: 34),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      RowCartPrice(
                                        firstText: S.of(context).Total_price,
                                        lastText: state.totalPrice,
                                        isFirstRow: true,
                                      ),
                                      RowCartPrice(
                                        firstText: S
                                            .of(context)
                                            .Total_price_after_discount,
                                        lastText:
                                            state.totalPriceAfterDiscount !=
                                                    state.totalPrice
                                                ? state.totalPriceAfterDiscount
                                                : null,
                                      ),
                                      RowCartPrice(
                                        firstText: S.of(context).Coupon_value,
                                        lastText: state.couponValue,
                                      ),
                                      RowCartPrice(
                                        firstText: S.of(context).Delivery_price,
                                        lastText: state.deliveryPrice,
                                      ),
                                      9.verticalSpace,
                                      DottedBorder(
                                        strokeWidth: 1,
                                        customPath: (size) {
                                          return Path()
                                            ..moveTo(0, 20)
                                            ..lineTo(size.width, 20);
                                        },
                                        child: const RPadding(
                                          padding: EdgeInsets.all(16.0),
                                          child: SizedBox(),
                                        ),
                                      ),
                                      RowCartPrice(
                                        firstText: S.of(context).Price_all,
                                        lastText: state.priceAll,
                                        isLastRow: true,
                                      ),
                                      29.verticalSpace,
                                    ],
                                  ),
                                  if (state.durations.inSeconds != 0 &&
                                      state.sequentialEventsCount != 0)
                                    Positioned.fill(
                                        child: Container(
                                      color:
                                          context.colorScheme.backgroundColor,
                                      child: LoadingWidget(),
                                    ))
                                ],
                              ),
                              AppButton.dark(
                                onPressed: () async {
                                  if (state.addressId == null ||
                                      state.addressId == '') {
                                    isShowBorderNotifier.value = true;
                                  } else {
                                    isShowBorderNotifier.value = false;

                                    onPressedNotifier.value = true;
                                    Timer(
                                      state.durations,
                                      () {
                                        context
                                            .read<CartBloc>()
                                            .add(AddOrderEvent(
                                              storeId: context
                                                      .read<HomeBloc>()
                                                      .state
                                                      .storeSelected
                                                      ?.id ??
                                                  "",
                                              onSuccess: () {
                                                onPressedNotifier.value = false;
                                                context.pop();
                                              },
                                              onFailure: () => onPressedNotifier
                                                  .value = false,
                                            ));
                                      },
                                    );
                                  }
                                },
                                title: S.of(context).Send_the_request,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              loading: const LoadingWidget(),
              error: (Exception? error) {
                return ErrorWidgetPage(
                  onPressed: () {
                    context.read<CartBloc>().add(GetCartEvent());
                  },
                );
              },
              result: state.getCartState,
              empty: const EmptyWidget(),
            ),
          ),
        ),
      );
    });
  }
}
