
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/cart/data/model/cart_model.dart';
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../data/model/extra_item.dart';

@injectable
class AddToCartCartUseCase extends UseCase<bool,AddToCartParams> {
  final CartRepository _repository;
  AddToCartCartUseCase(this._repository);

  @override
  FutureResult<bool> call(params)=>_repository.addToCart(params);


}
class AddToCartParams {
  final String id;
  final int quantity;
  final List<ExtraItemModel> list;

  AddToCartParams({
    required this.id,
    required this.quantity,
    required this.list,
  });

  Map<String, dynamic> toMap() {
    final List<Map> newList = [];
    list.forEach((e) {
      if (e.selected == true) {
        newList.add({"id": e.id, "quantity": e.quantity});
      }
    });
    return <String, dynamic>{
      'productId': id,
      'quantity': quantity,
      'extraItems': newList
    };
  }


}
