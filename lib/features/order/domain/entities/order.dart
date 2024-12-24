import '../../../../core/enums/order_status.dart';

class OrderEntity {
  final String id;
  final String number;
  final OrderStatus? status;
  final DateTime? date;
  final int? itemCount;
  final num? totalPrice;

  OrderEntity({
    required this.id,
    required this.number,
     this.status,
     this.date,
     this.itemCount,
     this.totalPrice,
  });
}
