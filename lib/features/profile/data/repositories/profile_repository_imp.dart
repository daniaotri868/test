import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/network/network.dart';
import 'package:restaurant_customer/features/profile/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/profile/domain/use_case/update_profile_use_case.dart';

import '../../../../core/utils/types.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_sources/profile_remote_datasource.dart';
import '../model/profile_model.dart';



@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  final ProfileRemoteDataSource dataSource;
  ProfileRepositoryImp({required this.dataSource});

  @override

  FutureResult<ProfileModel> getProfile()  => toApiResult(() async=> dataSource.getProfile());

  @override
  FutureResult<List<CouponModel>> getAllCoupon(bool status)  =>toApiResult(()async=>dataSource.getAllCoupon(status));

  @override
  FutureResult<bool> logOut() =>toApiResult(()async=>dataSource.logout());

  @override
  FutureResult<bool> updateProfile(UpdateProfileeParam param) =>toApiResult(()async=>dataSource.updateProfile(param));




}
