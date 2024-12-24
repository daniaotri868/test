import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../data/model/update_cart_model.dart';
import 'get_cart_use_case.dart';

@injectable
class RemoveItemUseCase extends UseCase<UpdateCartModel, CartParams> {
  final CartRepository _repository;

  RemoveItemUseCase(this._repository);

  @override
  FutureResult<UpdateCartModel> call(CartParams params) =>
      _repository.removeItem(params);
}
