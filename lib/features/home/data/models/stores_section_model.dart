
class StoresItem {
  final String ?id;
  final String ?name;
  final String ?address;
  final double ?lat;
  final double ?lon;

  StoresItem({
    this.id,
    this.name,
    this.address,
    this.lat,
    this.lon,
  });

  factory StoresItem.fromJson(Map<String, dynamic> json) => StoresItem(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    lon: json["lon"],
    lat: json["lat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "lat": lat,
    "lon": lon,
  };
}