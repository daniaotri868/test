class CouponModel {
  final String? id;
  final DateTime? endDate;
  final String? code;
  final String? name;
  final int? value;
  final int? precent;
  final bool? isUsed;

  CouponModel({
    required this.id,
    required this.endDate,
    required this.code,
    required this.name,
    required this.value,
    required this.precent,
    required this.isUsed,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["id"],
        endDate: DateTime.parse(json["endDate"]),
        code: json["code"],
        name: json["name"],
        value: json["value"],
        precent: json["precent"],
        isUsed: json["isUsed"],
      );
}
