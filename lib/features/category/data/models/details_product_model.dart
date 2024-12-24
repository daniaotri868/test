
import '../../../cart/data/model/extra_item.dart';

class DetailsProductModel {
  final String ?id;
  final String ?name;
  final String ?description;
  final String ?image;
  final String ?categoryName;
  final num ?price;
  final num ?offerPrice;
  final bool ?isFavorite;
  final int ?preparingTime;
  final String ?unit;
  final num ?unitValue;
  final List<ExtraItemModel> ?extraItem;



  DetailsProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryName,
    this.price,
    this.offerPrice,
    this.isFavorite,
    this.preparingTime,
    this.unit,
    this.unitValue,
    this.extraItem,


  });

  factory DetailsProductModel.fromJson(Map<String, dynamic> json) => DetailsProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    categoryName: json["categoryName"],
    price: json["price"],
    offerPrice: json["offerPrice"],
    isFavorite: json["isFavorite"],
    preparingTime: json["preparingTime"],
    unit: json["unit"],
    unitValue: json["unit_Value"],
    extraItem: List<ExtraItemModel>.from((json["extraItem"]??[]).map((x) => ExtraItemModel.fromJson(x))),


  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "categoryName": categoryName,
    "price": price,
    "offerPrice": offerPrice,
    "isFavorite": isFavorite,
    "preparingTime": preparingTime,
    "unit": unit,
    "unit_Value": unitValue,
    "extraItem": List<dynamic>.from((extraItem??[]).map((x) => x.toJson())),


  };

  DetailsProductModel copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    String? categoryName,
    num? price,
    num? offerPrice,
    bool? isFavorite,
    int? preparingTime,
    String? unit,
    num? unitValue,
    List<ExtraItemModel>? extraItem,
  }) {
    return DetailsProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      categoryName: categoryName ?? this.categoryName,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      isFavorite: isFavorite ?? this.isFavorite,
      preparingTime: preparingTime ?? this.preparingTime,
      unit: unit ?? this.unit,
      unitValue: unitValue ?? this.unitValue,
      extraItem: extraItem ?? this.extraItem,
    );
  }
}
