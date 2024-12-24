import 'package:restaurant_customer/features/home/data/models/product_item_model.dart';

class LastItems {
  final int? pageNumber;
  final int? totalPages;
  final int? totalDataCount;
  final List<Product>? data;

  LastItems({
    this.pageNumber,
    this.totalPages,
    this.totalDataCount,
    this.data,
  });

  factory LastItems.fromJson(Map<String, dynamic> json) => LastItems(
        pageNumber: json["pageNumber"],
        totalPages: json["totalPages"],
        totalDataCount: json["totalDataCount"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "totalPages": totalPages,
        "totalDataCount": totalDataCount,
        "data": List<dynamic>.from((data ?? []).map((x) => x.toJson())),
      };
}
