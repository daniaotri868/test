class Product {
  final String ?id;
  final String ?name;
  final String ?image;
  final num ?price;
  final num ?offerPrice;

  Product({
    this.id,
    this.name,
    this.image,
    this.price,
    this.offerPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    offerPrice: json["offerPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "price": price,
    "offerPrice": offerPrice,
  };
}