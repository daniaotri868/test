import '../../../home/data/models/category_section_model.dart';

class AllCategoryModel {
  final int ?pageNumber;
  final int ?totalPages;
  final int ?totalDataCount;
  final List<CategoriesItem> ?data;

  AllCategoryModel({
    this.pageNumber,
    this.totalPages,
    this.totalDataCount,
    this.data,
  });

  factory AllCategoryModel.fromJson(Map<String, dynamic> json) => AllCategoryModel(
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

