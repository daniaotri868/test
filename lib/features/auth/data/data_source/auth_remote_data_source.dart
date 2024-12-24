import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/auth/data/model/Adress_details_model.dart';

import '../../../../core/config/api_routes.dart';
import '../../../../core/network/api_utils.dart';
import '../../domain/use_case/add_user_location_use_case.dart';
import '../../domain/use_case/register_request_use_case.dart';
import '../model/register_model.dart';

@injectable
class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});

  Future<RegisterModel> registerRequest(RegisterParam param) async {
    return await throwAppException(() async {
      final result =
          await dio.post(ApiRoutes.auth.register, data: param.toMap());
      return RegisterModel.fromJson(result.data);
    });
  }

  Future addUserLocation(AddUserLocationParam param) async {
    return await throwAppException(() async {
      await dio.post(ApiRoutes.auth.addUserLocationStep, data: param.toMap());
    });
  }

  Future<AdressDetailsModel> getAdressDetails(LatLng latlon) async {
    return await throwAppException(() async {
      final result = await dio.get(
        ApiRoutes.adress.getAdress,
        queryParameters: {"Lat": latlon.latitude, "Lon": latlon.longitude},
      );
      return AdressDetailsModel.fromJson(result.data);
    });
  }
}
