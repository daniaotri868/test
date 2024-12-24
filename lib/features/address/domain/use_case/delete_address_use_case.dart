
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../repositories/address_repo.dart';

@injectable
class DeleteAdressUseCase extends UseCase<bool,String> {
  final AddressRepo _repository;
  DeleteAdressUseCase(this._repository);

  @override
  FutureResult<bool> call(String id)=>_repository.deleteAddress(id);


}
