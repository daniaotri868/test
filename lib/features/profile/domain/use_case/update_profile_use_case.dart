
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../data/model/profile_model.dart';

@injectable
class UpdateProfileUseCase extends UseCase<bool, UpdateProfileeParam> {
  final ProfileRepository _repository;
  UpdateProfileUseCase(this._repository);

  @override
  FutureResult<bool> call(UpdateProfileeParam params)=>_repository.updateProfile(params);


}
class UpdateProfileeParam {
  String firstName;
  String lastName;
  String gender;
  UpdateProfileeParam({
    required this.firstName,
    required this.lastName,
    required this.gender,
  });

  Map<String, dynamic> get toMapp {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Gender': gender=='Male'?0:1,
    };
  }
}