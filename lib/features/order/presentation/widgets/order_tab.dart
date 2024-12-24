import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/order/domain/entities/order.dart';
import 'package:restaurant_customer/generated/flutter_gen/assets.gen.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/network/param.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../bloc/order_bloc.dart';
import 'order_item.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key, required this.isActive});

  final bool isActive;

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  final OrderBloc _orderBloc = GetIt.I<OrderBloc>();

  @override
  void initState() {
    _orderBloc.state.pagingController.addPageRequestListener((pageKey) {
      _orderBloc.add(GetAllOrderEvent(
          params: PagingParams(
              pageKey: pageKey, isActive: widget.isActive, pageSize: 10)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => _orderBloc.state.pagingController.refresh(),
      child: Padding(
        padding: REdgeInsets.all(19),
        child: Column(
          children: [
            Row(
              children: [
                AppImage.asset(
                  Assets.icons.filter,
                  width: 20,
                  height: 20,
                ),
                14.horizontalSpace,
                Expanded(
                  child: AppTextFormField(
                    hintText: S.of(context).Search_by_order_number,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 28,
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Expanded(
              child: PagedListView.separated(
                pagingController: _orderBloc.state.pagingController,
                builderDelegate: PagedChildBuilderDelegate<OrderEntity>(
                    itemBuilder:
                        (BuildContext context, OrderEntity item, int index) =>
                            OrderItem(
                              order: item,
                            )),
                separatorBuilder: (context, index) => 12.verticalSpace,
              ),
            )
          ],
        ),
      ),
    );
  }
}
