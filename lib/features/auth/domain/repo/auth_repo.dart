import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/auth/data/model/Adress_details_model.dart';
import 'package:restaurant_customer/features/auth/data/model/register_model.dart';
import 'package:restaurant_customer/features/auth/domain/use_case/add_user_location_use_case.dart';
import 'package:restaurant_customer/features/auth/domain/use_case/register_request_use_case.dart';

abstract class AuthRepo {
  FutureResult<RegisterModel> registerRequest(RegisterParam param);
  FutureResult addUserLocationStep(AddUserLocationParam param);
  FutureResult<AdressDetailsModel> getAdressDetails(LatLng latlon);
}
