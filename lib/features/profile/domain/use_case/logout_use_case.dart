
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../data/model/profile_model.dart';

@injectable
class LogoutUseCase extends UseCaseNoParam<bool> {
  final ProfileRepository _repository;
  LogoutUseCase(this._repository);

  @override
  FutureResult<bool> call()=>_repository.logOut();


}
