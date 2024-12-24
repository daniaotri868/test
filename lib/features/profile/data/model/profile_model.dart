// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));


class ProfileModel  extends Equatable{
  String? firstName;
  String? lastName;
  String? number;
  String? email;
  String? gender;
  ProfileModel({
    required this.firstName,
    required this.lastName,
     this.number,
     this.email,
    required this.gender,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      ProfileModel(
    gender: json["gender"],
    email: json["email"],
        number: json["number"],
        lastName: json["lastName"],
        firstName: json["firstName"],
  );

  @override
  List<Object?> get props => [
    firstName,lastName,gender
  ];


}




