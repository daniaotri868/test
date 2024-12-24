import '../../../../core/enums/order_status.dart';
import '../../../cart/data/model/extra_item.dart';

class OrderDetailsModel {
  final String id;
  final String number;
  final OrderStatus? status;
  final DateTime? date;
  final DateTime? expectedTime;
  final num? totalPrice;
  final List<Item>? items;
  final String? customerName;
  final String? customerPhoneNumber;
  final Address? address;

  OrderDetailsModel({
    required this.id,
    required this.number,
     this.status,
     this.date,
     this.expectedTime,
     this.totalPrice,
     this.items,
     this.customerName,
     this.customerPhoneNumber,
     this.address,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json["id"],
        number: json["number"],
        status:json["status"]!=null? orderStatusFromIndex(json["status"]):OrderStatus.pending,
        date: json["date"]!=null?DateTime.parse(json["date"]):DateTime.now(),
        expectedTime:json["expectedTime"]!=null? DateTime.parse(json["expectedTime"]):DateTime.now(),
        totalPrice: json["totalPrice"]??0.0,
        items:json["items"]!=null? List<Item>.from(json["items"].map((x) => Item.fromJson(x))):[],
        customerName: json["customerName"]??"",
        customerPhoneNumber: json["customerPhoneNumber"]??"",
        address: json["address"]!=null?Address.fromJson(json["address"]):Address(),
      );
}

class Address {
  final String? addressTitle;
  final String? street;
  final String? addressBuilding;
  final String? addressDetail;
  final String? city;

  Address({
     this.addressTitle,
     this.street,
     this.addressBuilding,
     this.addressDetail,
     this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressTitle: json["addressTitle"]??"",
        street: json["street"]??"",
        addressBuilding: json["addressBuilding"]??"",
        addressDetail: json["addressDetail"]??"",
        city: json["city"]??"",
      );
}

class Item {
  final String id;
  final String? name;
  final int? quantity;
  final String? image;
  final num? price;
  final List<ExtraItemModel>? extraItems;

  Item({
     required this.id,
     this.name,
     this.quantity,
     this.image,
     this.price,
     this.extraItems,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"]??"",
        quantity: json["quantity"]??0,
        image: json["image"]??"",
        price: json["price"]??0.0,
        extraItems:json["extraItems"]!=null? List<ExtraItemModel>.from(
            json["extraItems"].map((x) => ExtraItemModel.fromJson(x))):[],
      );
}
