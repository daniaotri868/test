
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../data/model/profile_model.dart';

@injectable
class GetProfileUseCase extends UseCaseNoParam<ProfileModel> {
  final ProfileRepository _repository;
  GetProfileUseCase(this._repository);

  @override
  FutureResult<ProfileModel> call()=>_repository.getProfile();


}
