import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/cart/data/model/update_cart_model.dart';
import 'package:restaurant_customer/features/cart/domain/use_case/add_order_use_case.dart';

import '../../../../core/config/api_routes.dart';
import '../../../../core/network/api_utils.dart';
import '../../domain/use_case/add_to_cart_usecase.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../domain/use_case/get_all_coupons_use_case.dart';
import '../../domain/use_case/get_cart_use_case.dart';
import '../../domain/use_case/update_extra_item_use_case.dart';
import '../model/address_model.dart';
import '../model/cart_model.dart';
import '../model/coupon_model.dart';

@injectable
class CartRemoteDataSource {
  CartRemoteDataSource({required this.dio});

  final Dio dio;

  Future<CartModel> getCart(CartParams params) async {
    return throwAppException(() async {
      final result = await dio.get(ApiRoutes.cart.getCart,
          queryParameters: params.toMap());
      return CartModel.fromJson(result.data);
    });
  }

  Future<UpdateCartModel> applyCoupon(CartParams params) async {
    return throwAppException(() async {
      final result =
          await dio.put(ApiRoutes.cart.applyCoupon, data: params.toMap());
      return UpdateCartModel.fromJson(result.data);
    });
  }

  Future<UpdateCartModel> removeItem(CartParams params) async {
    return throwAppException(() async {
      final result =
          await dio.delete(ApiRoutes.cart.removeItem, data: params.toMap());
      return UpdateCartModel.fromJson(result.data);
    });
  }

  Future<UpdateCartModel> updateCart(CartParams params) async {
    return throwAppException(() async {
      final result =
          await dio.put(ApiRoutes.cart.updateCart, data: params.toMap());
      return UpdateCartModel.fromJson(result.data);
    });
  }

  Future<UpdateCartModel> updateExtraItem(UpdateExtraItemParams params) async {
    return throwAppException(() async {
      final result = await dio.put(ApiRoutes.cart.updateExtraItemQuantity,
          data: params.toMap());
      return UpdateCartModel.fromJson(result.data);
    });
  }

  Future<PaginationModel<CouponModel>> getAllCoupons(
      GetAllCouponsParams params) async {
    return await throwAppException(() async {
      final response = await dio.get(ApiRoutes.cart.getAllCoupon,
          queryParameters: params.toMap());
      return PaginationModel.fromJson(
          response.data, (json) => CouponModel.fromJson(json));
    });
  }

  Future<List<AddressModel>> getAllAddress() async {
    return throwAppException(() async {
      final result = await dio.get(ApiRoutes.cart.getAllAddress, data: {
        "pageSize": 0,
      });

      var data = result.data["data"] as List;
      List<AddressModel> allAddress =
          data.map((e) => AddressModel.fromJson(e)).toList();
      return allAddress;
    });
  }

  Future<bool> addToCart(AddToCartParams params) async {
    return throwAppException(() async {
      await dio.post(ApiRoutes.cart.addToCart, data: params.toMap());
      return true;
    });
  }

  Future<bool> addOrder(AddOrderParams params) async {
    return throwAppException(() async {
      await dio.post(ApiRoutes.cart.addOrder, data: params.toMap());
      return true;
    });
  }
}
