import 'home_model.dart';

class Banners {
  final int ?pageNumber;
  final int ?totalPages;
  final int ?totalDataCount;
  final List<BannerItem> ?data;

  Banners({
    this.pageNumber,
    this.totalPages,
    this.totalDataCount,
    this.data,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
    pageNumber: json["pageNumber"],
    totalPages: json["totalPages"],
    totalDataCount: json["totalDataCount"],
    data: List<BannerItem>.from(json["data"].map((x) => BannerItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageNumber": pageNumber,
    "totalPages": totalPages,
    "totalDataCount": totalDataCount,
    "data": List<dynamic>.from((data??[]).map((x) => x.toJson())),
  };
}

class BannerItem {
  final String ?id;
  final String ?image;
  final DateTime ?startTime;
  final DateTime ?endTime;
  final String ?url;
  final String ?productId;
  final String ?categoryId;

  BannerItem({
    this.id,
    this.image,
    this.startTime,
    this.endTime,
    this.url,
    this.productId,
    this.categoryId,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) => BannerItem(
    id: json["id"],
    image: json["image"],
    startTime: DateTime.parse(json["startTime"]),
    endTime: DateTime.parse(json["endTime"]),
    url: json["url"],
    productId: json["productId"],
    categoryId: json["categoryId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "startTime": startTime?.toIso8601String(),
    "endTime": endTime?.toIso8601String(),
    "url": url,
    "productId": productId,
    "categoryId": categoryId,
  };
}