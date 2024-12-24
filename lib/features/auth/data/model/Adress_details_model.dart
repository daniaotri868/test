class AdressDetailsModel {
  final String? city;
  final String? street;

  AdressDetailsModel({
    this.city,
    this.street,
  });

  AdressDetailsModel copyWith({
    String? city,
    String? street,
  }) =>
      AdressDetailsModel(
        city: city ?? this.city,
        street: street ?? this.street,
      );

  factory AdressDetailsModel.fromJson(Map<String, dynamic> json) =>
      AdressDetailsModel(
        city: json["city"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "street": street,
      };
}
