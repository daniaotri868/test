




import 'extra_item.dart';

class CartModel {
  final List<CartItemModel>? items;
  final num? deliveryPrice;
  final DateTime? expectedTime;
  final num? couponValue;
  final num? totalPriceAfterDiscount;
  final num? totalPrice;
  final num? priceAll;

  CartModel({
     this.items,
     this.deliveryPrice,
     this.expectedTime,
     this.couponValue,
     this.totalPriceAfterDiscount,
     this.totalPrice,
     this.priceAll,
  });

  CartModel copyWith({
    List<CartItemModel>? items,
    num? deliveryPrice,
    DateTime? expectedTime,
    num? couponValue,
    num? totalPriceAfterDiscount,
    num? totalPrice,
    num? priceAll,
  }) =>
      CartModel(
        items: items ?? this.items,
        deliveryPrice: deliveryPrice ?? this.deliveryPrice,
        expectedTime: expectedTime ?? this.expectedTime,
        couponValue: couponValue ?? this.couponValue,
        totalPriceAfterDiscount:
            totalPriceAfterDiscount ?? this.totalPriceAfterDiscount,
        totalPrice: totalPrice ?? this.totalPrice,
        priceAll: priceAll ?? this.priceAll,
      );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        items: List<CartItemModel>.from(
            json["items"].map((x) => CartItemModel.fromJson(x))),
        deliveryPrice: json["deliveryPrice"],
        expectedTime: json["expectedTime"] != null
            ? DateTime.parse(json["expectedTime"])
            : json["expectedTime"],
        couponValue: json["couponValue"],
        totalPriceAfterDiscount: json["totalPriceAfterDiscount"],
        totalPrice: json["totalPrice"],
        priceAll: json["priceAll"],
      );
}

class CartItemModel {
  final String ?id;
  final String? name;
  final String? image;
  final String? productId;
  final num ?price;

  final num ?quantity;
  final num ?originalQuantity;
  final List<ExtraItemModel>? extraItems;

  CartItemModel({
    this.originalQuantity,
    this.id,
    this.productId,
    this.name,
    this.image,
    this.price,
    this.quantity,
    this.extraItems,
  });

  CartItemModel copyWith({
    String? id,
    String? productId,
    String? name,
    String? image,
    num? price,
    num? quantity,
    num? originalQuantity,
    List<ExtraItemModel>? extraItems,
  }) =>
      CartItemModel(
        originalQuantity: originalQuantity ?? this.originalQuantity,
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        productId: productId ?? this.productId,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        extraItems: extraItems ?? this.extraItems,
      );

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json["id"],
        name: json["name"],
        productId: json["productId"],
        image: json["image"]??"",
        price: json["price"]??0,
        quantity: json["quantity"]??1,
        originalQuantity: json["quantity"]??1,
        extraItems: json["extraItems"] == null
            ? []
            : List<ExtraItemModel>.from(
                json["extraItems"].map((x) => ExtraItemModel.fromJson(x))),
      );
}
