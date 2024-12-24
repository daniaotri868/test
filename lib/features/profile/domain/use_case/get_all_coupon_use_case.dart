
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/profile/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/utils/use_case.dart';

@injectable
class GetAllCouponUseCase extends UseCase<List<CouponModel>,bool> {
  final ProfileRepository _repository;
  GetAllCouponUseCase(this._repository);

  @override
  FutureResult<List<CouponModel>> call(bool status)=>_repository.getAllCoupon(status);


}
