class Categories {
  final int ?pageNumber;
  final int ?totalPages;
  final int ?totalDataCount;
  final List<CategoriesItem> ?data;

  Categories({
    this.pageNumber,
    this.totalPages,
    this.totalDataCount,
    this.data,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    pageNumber: json["pageNumber"],
    totalPages: json["totalPages"],
    totalDataCount: json["totalDataCount"],
    data: List<CategoriesItem>.from(json["data"].map((x) => CategoriesItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "totalPages": totalPages,
    "totalDataCount": totalDataCount,
    "data": List<dynamic>.from((data??[]).map((x) => x.toJson())),
  };
}

class CategoriesItem {
  final String ?id;
  final String ?name;
  final String ?image;

  CategoriesItem({
    this.id,
    this.name,
    this.image,
  });

  factory CategoriesItem.fromJson(Map<String, dynamic> json) => CategoriesItem(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}