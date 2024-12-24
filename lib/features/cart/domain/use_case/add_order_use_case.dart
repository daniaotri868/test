import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/utils/use_case.dart';

@injectable
class AddOrderUseCase extends UseCase<bool, AddOrderParams> {
  final CartRepository _repository;

  AddOrderUseCase(this._repository);

  @override
  FutureResult<bool> call(params) => _repository.addOrder(params);
}

class AddOrderParams {
  final String? addressId;
  final String? storeId;
  final String? code;
  final String? note;
  final int? notAvailable;

  AddOrderParams(
      {this.addressId, this.storeId, this.code, this.note, this.notAvailable});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addressId': addressId,
      'storeId': storeId,
      'code': code,
      'note': note,
      'notAvailable': notAvailable
    };
  }
}
