import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/cart/data/model/address_model.dart';
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';

@injectable
class GetAllAddressUseCase extends UseCaseNoParam<List<AddressModel>> {
  final CartRepository _repository;

  GetAllAddressUseCase(this._repository);

  @override
  FutureResult<List<AddressModel>> call() => _repository.getAllAddress();
}
