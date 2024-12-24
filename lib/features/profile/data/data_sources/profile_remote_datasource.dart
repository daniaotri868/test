import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/profile/data/model/coupon_model.dart';

import '../../../../core/config/api_routes.dart';
import '../../../../core/network/api_utils.dart';
import '../../../../core/network/param.dart';
import '../../domain/use_case/update_profile_use_case.dart';
import '../model/profile_model.dart';

@injectable
class ProfileRemoteDataSource {
  ProfileRemoteDataSource({required this.dio});
  final Dio dio;

  Future<ProfileModel> getProfile() async {
    return throwAppException(() async {
      final result = await dio.get(ApiRoutes.profile.getProfile);
      return ProfileModel.fromJson(result.data) ;
    });
  }



  Future<List<CouponModel>> getAllCoupon(bool status) async {
    return throwAppException(() async {
      final result = await dio.get(ApiRoutes.profile.getAllCoupon,queryParameters: PagingParams(status: status.toString()).toMap());
      var data = result.data["data"] as List;
      List<CouponModel> allCoupon =
      data.map((e) => CouponModel.fromJson(e)).toList();
      return allCoupon;
    });
  }

  Future<bool> logout() async {
    return throwAppException(() async {
      final result = await dio.delete(ApiRoutes.profile.logOut,data: {});
      return true ;
    });
  }

  Future<bool> updateProfile(UpdateProfileeParam param) async {
    return throwAppException(() async {
      final result = await dio.put(ApiRoutes.profile.updateProfile,data: param.toMapp);
      return true ;
    });
  }

}
