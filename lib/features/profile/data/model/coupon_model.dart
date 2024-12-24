class CouponModel {
  String id;
  String? endDate;

  String? name;
  String? code;
  int? value;
  int? precent;

  CouponModel({
    required this.id,
    required this.endDate,
    required this.name,
     this.value,
     this.precent,
this.code
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
    id: json["id"],
    precent: json["precent"],
    value: json["value"],
    name: json["name"],
    code: json["code"],
    endDate: json["endDate"],

  );

}