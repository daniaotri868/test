part of 'order_bloc.dart';

@immutable
class OrderState {
  final PagingController<int, OrderEntity> pagingController;
  final PageState<OrderDetailsModel> orderDetailsState;

  OrderState({
    this.orderDetailsState = const PageState.init(),
    PagingController<int, OrderEntity>? pagingController,
  }) : pagingController = pagingController ?? PagingController(firstPageKey: AppConst.pageKey);

  OrderState copyWith({
    final PageState<OrderDetailsModel> ?orderDetailsState,
    PagingController<int, OrderEntity>? pagingController,
  }) {
    return OrderState(
      pagingController: pagingController ?? this.pagingController,
      orderDetailsState: orderDetailsState ?? this.orderDetailsState,
    );
  }
}
