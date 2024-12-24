import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/cart/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart';

import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';
import '../../../app/data/models/pagination_model.dart';

@injectable
class GetAllCouponsUseCase
    extends UseCase<PaginationModel<CouponModel>, GetAllCouponsParams> {
  final CartRepository _repository;

  GetAllCouponsUseCase(this._repository);

  @override
  FutureResult<PaginationModel<CouponModel>> call(params) =>
      _repository.getAllCoupons(params: params);
}

class GetAllCouponsParams {
  final bool status;
  final int? pageSize;
  final int? pageNumber;

  GetAllCouponsParams({
    this.status = true,
    this.pageSize = 0,
    this.pageNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Status': status,
      'PageSize': pageSize,
    };
  }

  String toJson() => json.encode(toMap());
}
