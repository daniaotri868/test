class InitialModel {
  final bool? hasUpdate;
  final bool? isRequired;

  InitialModel({
    this.hasUpdate,
    this.isRequired,
  });

  InitialModel copyWith({
    bool? hasUpdate,
    bool? isRequired,
  }) =>
      InitialModel(
        hasUpdate: hasUpdate ?? this.hasUpdate,
        isRequired: isRequired ?? this.isRequired,
      );

  factory InitialModel.fromJson(Map<String, dynamic> json) => InitialModel(
        hasUpdate: json["hasUpdate"],
        isRequired: json["isRequired"],
      );

  Map<String, dynamic> toJson() => {
        "hasUpdate": hasUpdate,
        "isRequired": isRequired,
      };
}
