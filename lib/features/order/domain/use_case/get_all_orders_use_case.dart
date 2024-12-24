import 'package:injectable/injectable.dart';

import '../../../../core/network/param.dart';
import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';
import '../../../app/data/models/pagination_model.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

@injectable
class GetAllOrdersUseCase
    extends UseCase<PaginationModel<OrderEntity>, PagingParams> {
  final OrderRepository _repository;

  GetAllOrdersUseCase(this._repository);

  @override
  FutureResult<PaginationModel<OrderEntity>> call(PagingParams params) =>
      _repository.getAllOrders(params: params);
}
