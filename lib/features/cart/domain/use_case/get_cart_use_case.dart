import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/cart/data/model/cart_model.dart';
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart';
import '../../../../core/utils/use_case.dart';

@injectable
class GetCartUseCase extends UseCase<CartModel, CartParams> {
  final CartRepository _repository;

  GetCartUseCase(this._repository);

  @override
  FutureResult<CartModel> call(CartParams params) =>
      _repository.getCart(params);
}

class CartParams {
  final String? id;
  final num? quantity;
  final String? addressId;
  final String? storeId;
  final String? code;
  final String? cartId;
  final String? extraId;

  CartParams(
      {this.addressId,
      this.storeId,
      this.code,
      this.id,
      this.quantity,
      this.cartId,
      this.extraId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'addressId': addressId,
      'storeId': storeId,
      'code': code,
      'cartId': cartId,
      'extraId': extraId
    }..removeWhere((key, value) => value == null || value == '');
  }
}
