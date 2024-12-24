import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/network/api_utils.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:restaurant_customer/features/auth/data/model/Adress_details_model.dart';
import 'package:restaurant_customer/features/auth/data/model/register_model.dart';
import 'package:restaurant_customer/features/auth/domain/repo/auth_repo.dart';
import 'package:restaurant_customer/features/auth/domain/use_case/add_user_location_use_case.dart';
import 'package:restaurant_customer/features/auth/domain/use_case/register_request_use_case.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp extends AuthRepo {
  AuthRemoteDataSource remoteDataSource;
  AuthRepoImp(this.remoteDataSource);
  @override
  FutureResult<RegisterModel> registerRequest(RegisterParam param) {
    return toApiResult(
        () async => await remoteDataSource.registerRequest(param));
  }

  @override
  FutureResult addUserLocationStep(AddUserLocationParam param) {
    return toApiResult(
        () async => await remoteDataSource.addUserLocation(param));
  }

  @override
  FutureResult<AdressDetailsModel> getAdressDetails(LatLng latlon) {
    return toApiResult(
        () async => await remoteDataSource.getAdressDetails(latlon));
  }
}
