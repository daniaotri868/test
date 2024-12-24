class RegisterModel {
  final String? token;
  final String? refreshToken;
  final int? step;

  RegisterModel({
    this.token,
    this.refreshToken,
    this.step,
  });

  RegisterModel copyWith({
    String? token,
    String? refreshToken,
    int? step,
  }) =>
      RegisterModel(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
        step: step ?? this.step,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        token: json["token"],
        refreshToken: json["refreshToken"],
        step: json["step"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "step": step,
      };
}
