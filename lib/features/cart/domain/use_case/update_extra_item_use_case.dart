import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/cart/data/model/update_cart_model.dart';
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../data/model/extra_item.dart';

@injectable
class UpdateExtraItemUseCase
    extends UseCase<UpdateCartModel, UpdateExtraItemParams> {
  final CartRepository _repository;

  UpdateExtraItemUseCase(this._repository);

  @override
  FutureResult<UpdateCartModel> call(UpdateExtraItemParams params) =>
      _repository.updateExtraItem(params);
}

class UpdateExtraItemParams {
  final String cartId;
  final String? code;
  final String? addressId;
  final String? storeId;
  final List<ExtraItemModel> extraItems;

  UpdateExtraItemParams(
      {required this.cartId,
      required this.code,
      required this.addressId,
      required this.storeId,
      required this.extraItems});

  Map<String, dynamic> toMap() {
    final List<Map> newList = [];
    for (var e in extraItems) {
      if (e.selected == true) {
        newList.add({"id": e.id, "quantity": e.quantity});
      }
    }
    return <String, dynamic>{
      'cartId': cartId,
      'code': code,
      'addressId': addressId,
      'storeId': storeId,
      'extraItems': newList
    };
  }
}
