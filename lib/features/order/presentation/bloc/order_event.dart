part of 'order_bloc.dart';

@immutable
sealed class OrderEvent {}


class GetAllOrderEvent extends OrderEvent {
  final PagingParams params;

  GetAllOrderEvent({required this.params});
}
class GetOrderDetailsEvent extends OrderEvent {
  final String orderId;

  GetOrderDetailsEvent({required this.orderId});
}




