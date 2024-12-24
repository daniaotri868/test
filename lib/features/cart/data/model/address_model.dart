class AddressModel {
  final String? id;
  final double? lat;
  final double? lon;
  final String? city;
  final String? addressTitle;
  final String? building;
  final String? street;
  final String? detail;
  final String? customerId;

  AddressModel({
    required this.id,
    required this.lat,
    required this.lon,
    required this.city,
    required this.addressTitle,
    required this.building,
    required this.street,
    required this.detail,
    required this.customerId,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        lat: json["lat"],
        lon: json["lon"],
        city: json["city"],
        addressTitle: json["addressTitle"],
        building: json["building"],
        street: json["street"],
        detail: json["detail"],
        customerId: json["customerId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lon": lon,
        "city": city,
        "addressTitle": addressTitle,
        "building": building,
        "street": street,
        "detail": detail,
        "customerId": customerId,
      };
}
