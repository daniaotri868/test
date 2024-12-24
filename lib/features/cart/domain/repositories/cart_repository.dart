import 'package:restaurant_customer/features/cart/data/model/address_model.dart';
import 'package:restaurant_customer/features/cart/data/model/cart_model.dart';
import 'package:restaurant_customer/features/cart/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/cart/data/model/update_cart_model.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/add_order_use_case.dart';

import '../../../../core/utils/types.dart';
import '../use_case/add_to_cart_usecase.dart';
import '../../../app/data/models/pagination_model.dart';
import '../use_case/get_all_coupons_use_case.dart';
import '../use_case/get_cart_use_case.dart';
import '../use_case/update_extra_item_use_case.dart';

abstract class CartRepository {
  FutureResult<CartModel> getCart(CartParams params);

  FutureResult<UpdateCartModel> applyCoupon(CartParams params);

  FutureResult<UpdateCartModel> removeItem(CartParams params);

  FutureResult<UpdateCartModel> updateCart(CartParams params);

  FutureResult<UpdateCartModel> updateExtraItem(UpdateExtraItemParams params);

  FutureResult<PaginationModel<CouponModel>> getAllCoupons(
      {required GetAllCouponsParams params});

  FutureResult<List<AddressModel>> getAllAddress();

  FutureResult<bool> addToCart(AddToCartParams params);

  FutureResult<bool> addOrder(AddOrderParams params);
}
