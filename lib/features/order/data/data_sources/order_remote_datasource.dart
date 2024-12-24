import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/order/data/models/order_model.dart';

import '../../../../core/config/api_routes.dart';
import '../../../../core/network/api_utils.dart';
import '../../../../core/network/param.dart';
import '../../../app/data/models/pagination_model.dart';
import '../models/order_details_model.dart';

@injectable
class OrderRemoteDataSource {
  OrderRemoteDataSource({required this.dio});

  final Dio dio;

  Future<PaginationModel<OrderModel>> getAllOrders(
      PagingParams params) async {
    return await throwAppException(() async {
      final response = await dio.get(ApiRoutes.order.getAllOrders,
          queryParameters: params.toMap());
      return PaginationModel.fromJson(
          response.data, (json) => OrderModel.fromJson(json));
    });
  }

  Future<OrderDetailsModel> getOrderDetails(
      String orderId) async {
    return await throwAppException(() async {
      final response = await dio.get(ApiRoutes.order.getOrderDetails,
          queryParameters: {"Id":orderId});
      return OrderDetailsModel.fromJson(response.data);
    });
  }
}
