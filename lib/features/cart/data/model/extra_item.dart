class ExtraItemModel {
  final bool selected;
  final String id;
  final String? name;
  final num price;
  final num quantity;

  ExtraItemModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.selected});

  factory ExtraItemModel.fromJson(Map<String, dynamic> json) => ExtraItemModel(
        id: json["id"],
        name: json["name"]??"",
        price: json["price"] ?? 0,
        quantity: json["quantity"] ?? 1,
        selected: json["selected"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "selected": selected,
      };

  ExtraItemModel copyWith({
    bool? selected,
    String? id,
    String? name,
    num? price,
    num? quantity,
  }) {
    return ExtraItemModel(
      selected: selected ?? this.selected,
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
