import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/network/api_utils.dart';
import 'package:restaurant_customer/features/cart/data/model/cart_model.dart';
import 'package:restaurant_customer/features/cart/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/cart/data/model/update_cart_model.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/add_order_use_case.dart';

import '../../../../core/utils/types.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/use_case/get_all_coupons_use_case.dart';
import '../../domain/use_case/add_to_cart_usecase.dart';
import '../../domain/use_case/get_cart_use_case.dart';
import '../../domain/use_case/update_extra_item_use_case.dart';
import '../data_sources/cart_remote_datasource.dart';
import '../model/address_model.dart';

@Injectable(as: CartRepository)
class CartRepositoryImp implements CartRepository {
  final CartRemoteDataSource dataSource;

  CartRepositoryImp({required this.dataSource});


  @override
  FutureResult<PaginationModel<CouponModel>> getAllCoupons(
      {required GetAllCouponsParams params}) =>
      toApiResult(() => dataSource.getAllCoupons(params));

  @override
  FutureResult<List<AddressModel>> getAllAddress() =>
      toApiResult(() => dataSource.getAllAddress());

  @override
  FutureResult<UpdateCartModel> updateCart(CartParams params) =>
      toApiResult(() => dataSource.updateCart(params));

  @override
  FutureResult<UpdateCartModel> updateExtraItem(UpdateExtraItemParams params) =>
      toApiResult(() => dataSource.updateExtraItem(params));

  @override
  FutureResult<CartModel> getCart(CartParams params) =>
      toApiResult(() => dataSource.getCart(params));

  @override
  FutureResult<UpdateCartModel> applyCoupon(CartParams params) =>
      toApiResult(() => dataSource.applyCoupon(params));

  @override
  FutureResult<UpdateCartModel> removeItem(CartParams params) =>
      toApiResult(() => dataSource.removeItem(params));

  @override
  FutureResult<bool> addToCart(AddToCartParams params) =>  toApiResult(() => dataSource.addToCart(params));

  @override
  FutureResult<bool> addOrder(AddOrderParams params) =>
      toApiResult(() => dataSource.addOrder(params));
}
