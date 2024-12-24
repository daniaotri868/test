import 'package:restaurant_customer/features/order/domain/entities/order.dart';

import '../../../../core/enums/order_status.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.number,
     super.status,
     super.date,
     super.itemCount,
     super.totalPrice,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        number: json["number"],
        status:json["status"]!=null? orderStatusFromIndex(json["status"]):OrderStatus.pending,
        date:json["date"]!=null? DateTime.parse(json["date"]):DateTime.now(),
        itemCount: json["itemCount"]??0,
        totalPrice: json["totalPrice"]??0.0,
      );
}
