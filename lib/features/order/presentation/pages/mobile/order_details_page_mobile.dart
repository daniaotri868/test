import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/order/presentation/bloc/order_bloc.dart';

import '../../../../../../generated/l10n.dart';

import '../../../../../core/config/theme/app_theme.dart';
import '../../../../../core/helper/helper_function.dart';
import '../../../../app/presentation/widgets/app_appbar.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/error_widget.dart';
import '../../../../app/presentation/widgets/loading_widget.dart';
import '../../../../app/presentation/widgets/price_with_currency.dart';
import '../../widgets/card_Info_receive.dart';
import '../../widgets/card_location.dart';
import '../../widgets/order_product.dart';

class OrderDetailsPageMobile extends StatelessWidget {
  final OrderBloc _orderBloc = GetIt.I<OrderBloc>();
  final String orderId;

  OrderDetailsPageMobile({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          _orderBloc..add(GetOrderDetailsEvent(orderId: orderId)),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return AppScaffold(
            appBar: AppAppBar(
              showDefaultBackButton: true,
              label: S.of(context).Order_details,
            ),
            body: RefreshIndicator(
              onRefresh: () async =>
                  _orderBloc.add(GetOrderDetailsEvent(orderId: orderId)),
              child: Padding(
                padding: REdgeInsetsDirectional.only(
                    bottom: 22, start: 22, end: 22, top: 10),
                child: PageStateBuilder(
                  empty: const SizedBox.shrink(),
                  error: (Exception? error) {
                    return ErrorWidgetPage(
                      onPressed: () {
                        _orderBloc.add(GetOrderDetailsEvent(orderId: orderId));
                      },
                    );
                  },
                  init: const SizedBox.shrink(),
                  loading: const LoadingWidget(),
                  result: state.orderDetailsState,
                  success: (data) => ListView(
                    // padding: REdgeInsets.symmetric(horizontal: 20),
                    children: [
                      Row(
                        children: [
                          AppText.paragraphMedium(
                            S.of(context).Order_number,
                            color: context.colorScheme.secondary,
                          ),
                          AppText.paragraphMedium(
                            data.number,
                            color: context.colorScheme.secondary,
                          )
                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        children: [
                          AppText.paragraphRegular(
                            S.of(context).Order_status,
                            color: context.colorScheme.onSecondary,
                          ),
                          Padding(
                            padding: REdgeInsetsDirectional.only(
                                start: 5.5, end: 12),
                            child: CircleAvatar(
                              backgroundColor: data.status!.color,
                              radius: 9.r,
                            ),
                          ),
                          AppText.footnoteRegular(
                            data.status!.text,
                            color: data.status!.color,
                          )
                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.paragraphRegular(
                            S.of(context).Order_date,
                            color: context.colorScheme.onSecondary,
                          ),
                          Flexible(
                            child: AppText.footnoteRegular(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              
                              HelperFunctions.formatDateTimeToLocal(
                                data.date!,
                              ),
                              color: context.colorScheme.textColor,
                            ),
                          )
                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.paragraphRegular(
                            S
                                .of(context)
                                .The_Expected_Time_For_The_order_to_arrive,
                            color: context.colorScheme.onSecondary,
                          ),
                          Flexible(
                            child: AppText.footnoteRegular(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              HelperFunctions.formatDateTimeToLocal(
                                data.expectedTime!,
                              ),
                              color: context.colorScheme.textColor,
                            ),
                          )
                        ],
                      ),
                      12.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.paragraphRegular(
                            S.of(context).Total_price,
                            color: context.colorScheme.onSecondary,
                          ),
                          PriceWithCurrency(
                              price: data.totalPrice!,
                              style: textTheme.footnote.regular,
                              mainAxisAlignment: MainAxisAlignment.end)
                        ],
                      ),
                      RSizedBox(
                        height: context.fullHeight / 2,
                        child: Padding(
                          padding: REdgeInsets.symmetric(vertical: 20),
                          child: ListView.separated(
                              itemBuilder: (context, index) => OrderProduct(
                                    item: data.items![index],
                                  ),
                              separatorBuilder: (context, index) =>
                                  20.verticalSpace,
                              itemCount: data.items!.length),
                        ),
                      ),
                      CardInfoReceive(
                          customerName: data.customerName!,
                          customerPhoneNumber: data.customerPhoneNumber!),
                      20.verticalSpace,
                      CardLocation(address: data.address!)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
