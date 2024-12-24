import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_customer/common/constant/configuration/app_const.dart';
import 'package:restaurant_customer/features/order/data/models/order_details_model.dart';
import 'package:restaurant_customer/features/order/domain/use_case/get_all_orders_use_case.dart';
import 'package:restaurant_customer/features/order/domain/use_case/get_order_details_use_case.dart';

import '../../../../common/models/page_state/page_state.dart';
import '../../../../core/helper/helper_function.dart';
import '../../../../core/network/param.dart';
import '../../domain/entities/order.dart';

part 'order_event.dart';

part 'order_state.dart';

@injectable
class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetAllOrdersUseCase getAllOrdersUseCase;
  final GetOrderDetailsUseCase getOrderDetailsUseCase;

  OrderBloc(
      {required this.getAllOrdersUseCase, required this.getOrderDetailsUseCase})
      : super(OrderState()) {
    on<GetAllOrderEvent>(_onGetAllOrder);
    on<GetOrderDetailsEvent>(_onGetOrderDetails);
  }

  Future<void> _onGetOrderDetails(
      GetOrderDetailsEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(orderDetailsState: const PageState.loading()));
    final result = await getOrderDetailsUseCase(event.orderId);

    emit(state.copyWith(
        orderDetailsState: HelperFunctions.mapEitherToPageState(
      either: result,
    )));
  }

  Future<void> _onGetAllOrder(
      GetAllOrderEvent event, Emitter<OrderState> emit) async {
    final result = await getAllOrdersUseCase.call(event.params);

    state.copyWith(
        pagingController: HelperFunctions.pageNationEitherStatus(
            either: result,
            pageKey: event.params.pageKey!,
            pagingController: state.pagingController));
  }
}
