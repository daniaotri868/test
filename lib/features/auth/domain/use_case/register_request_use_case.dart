import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';
import 'package:restaurant_customer/features/auth/data/model/register_model.dart';
import 'package:restaurant_customer/features/auth/domain/repo/auth_repo.dart';

@injectable
class RegisterRequestUseCase extends UseCase<RegisterModel, RegisterParam> {
  final AuthRepo repo;
  RegisterRequestUseCase(this.repo);
  @override
  FutureResult<RegisterModel> call(RegisterParam params) {
    return repo.registerRequest(params);
  }
}

class RegisterParam {
  final String email;
  final String firstName;
  final String lastName;
  final String dialCode;
  final String phoneNumber;
  final int gender;
  final String fcmToken;
  final String deviceId;

  RegisterParam({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.dialCode,
    required this.phoneNumber,
    required this.gender,
    required this.fcmToken,
    required this.deviceId,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'dialCode': dialCode,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'fcmToken': fcmToken,
      'deviceId': deviceId,
    };
  }
}
