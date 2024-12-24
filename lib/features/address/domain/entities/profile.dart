import '../../../../core/enums/gender.dart';

 class Profile {
  final String firstName;
  final String? lastName;
  final String? email;
  final String dialCode;
  final String phoneNumber;
  final DateTime? birthdate;
  final Gender? gender;
  final String? image;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.dialCode,
    required this.phoneNumber,
    this.image,
    this.gender,
    this.email,
    this.birthdate,
  });
  Profile copyWith({String? image})=>Profile(
    dialCode: dialCode,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    image: image ?? this.image,
    birthdate: birthdate,
    email: email,
    gender: gender
  );
}
