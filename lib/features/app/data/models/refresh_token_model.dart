import 'dart:convert';

class RefreshToeknModel {
  final String? token;
  final String? refreshToken;

  RefreshToeknModel({
    this.token,
    this.refreshToken,
  });
  RefreshToeknModel refreshToeknModelFromJson(String str) =>
      RefreshToeknModel.fromJson(json.decode(str));

  String refreshToeknModelToJson(RefreshToeknModel data) =>
      json.encode(data.toJson());

  RefreshToeknModel copyWith({
    String? token,
    String? refreshToken,
  }) =>
      RefreshToeknModel(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory RefreshToeknModel.fromJson(Map<String, dynamic> json) =>
      RefreshToeknModel(
        token: json["token"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
      };
}
