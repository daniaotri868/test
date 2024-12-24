import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/order/data/models/order_details_model.dart';

import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';

import '../repositories/order_repository.dart';

@injectable
class GetOrderDetailsUseCase extends UseCase<OrderDetailsModel, String> {
  final OrderRepository _repository;

  GetOrderDetailsUseCase(this._repository);

  @override
  FutureResult<OrderDetailsModel> call(String params) =>
      _repository.getOrderDetails(orderId: params);
}
