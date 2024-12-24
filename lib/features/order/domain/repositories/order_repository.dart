import 'package:restaurant_customer/features/order/data/models/order_details_model.dart';

import '../../../../core/network/param.dart';
import '../../../../core/utils/types.dart';
import '../../../app/data/models/pagination_model.dart';
import '../entities/order.dart';

abstract class OrderRepository {
  FutureResult<PaginationModel<OrderEntity>> getAllOrders(
      {required PagingParams params});

  FutureResult<OrderDetailsModel> getOrderDetails({required String orderId});
}
