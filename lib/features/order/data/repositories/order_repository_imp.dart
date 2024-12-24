import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/order/data/models/order_details_model.dart';
import 'package:restaurant_customer/features/order/domain/entities/order.dart';
import 'package:restaurant_customer/features/order/domain/repositories/order_repository.dart';

import '../../../../core/network/api_utils.dart';
import '../../../../core/network/param.dart';
import '../../../../core/utils/types.dart';
import '../../../app/data/models/pagination_model.dart';
import '../data_sources/order_remote_datasource.dart';

@Injectable(as: OrderRepository)
class OrderRepositoryImp implements OrderRepository {
  final OrderRemoteDataSource dataSource;

  OrderRepositoryImp({required this.dataSource});

  @override
  FutureResult<PaginationModel<OrderEntity>> getAllOrders(
      {required PagingParams params}) {
    return toApiResult(() => dataSource.getAllOrders(params));
  }

  @override
  FutureResult<OrderDetailsModel> getOrderDetails({required String orderId}) =>
      toApiResult(() => dataSource.getOrderDetails(orderId));
}
