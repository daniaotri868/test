
import 'package:restaurant_customer/features/profile/data/model/coupon_model.dart';

import '../../../../../core/utils/types.dart';
import '../../data/model/profile_model.dart';
import '../use_case/update_profile_use_case.dart';


abstract class ProfileRepository {
  FutureResult<ProfileModel> getProfile();
  FutureResult<List<CouponModel>> getAllCoupon(bool status);
  FutureResult<bool> logOut();
  FutureResult<bool> updateProfile(UpdateProfileeParam param);


}
