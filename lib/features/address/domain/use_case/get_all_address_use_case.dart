
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/address/data/models/address_model.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../../profile/data/model/profile_model.dart';
import '../repositories/address_repo.dart';

@injectable
class GetAllAddressUseCase extends UseCaseNoParam<List<AddressModel>> {
  final AddressRepo _repository;
  GetAllAddressUseCase(this._repository);

  @override
  FutureResult<List<AddressModel>> call()=>_repository.getAllAddress();


}
