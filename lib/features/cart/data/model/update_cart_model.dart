class UpdateCartModel {
  final num? deliveryPrice;
  final DateTime? expectedTime;
  final num? couponValue;
  final num? totalPriceAfterDiscount;
  final num? totalPrice;
  final num? priceAll;

  UpdateCartModel({
    required this.deliveryPrice,
    required this.expectedTime,
    required this.couponValue,
    required this.totalPriceAfterDiscount,
    required this.totalPrice,
    required this.priceAll,
  });

  factory UpdateCartModel.fromJson(Map<String, dynamic> json) =>
      UpdateCartModel(
        deliveryPrice: json["deliveryPrice"],
        expectedTime: json["expectedTime"] != null
            ? DateTime.parse(json["expectedTime"])
            : null,
        couponValue: json["couponValue"],
        totalPriceAfterDiscount: json["totalPriceAfterDiscount"],
        totalPrice: json["totalPrice"],
        priceAll: json["priceAll"],
      );

  Map<String, dynamic> toJson() => {
        "deliveryPrice": deliveryPrice,
        "expectedTime": expectedTime,
        "couponValue": couponValue,
        "totalPriceAfterDiscount": totalPriceAfterDiscount,
        "totalPrice": totalPrice,
        "priceAll": priceAll,
      };
}
