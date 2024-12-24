import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';
import 'package:restaurant_customer/features/auth/data/model/Adress_details_model.dart';
import 'package:restaurant_customer/features/auth/domain/repo/auth_repo.dart';

@injectable
class GetAdressDetailsUseCase extends UseCase<AdressDetailsModel, LatLng> {
  final AuthRepo repo;
  GetAdressDetailsUseCase(this.repo);
  @override
  FutureResult<AdressDetailsModel> call(LatLng params) {
    return repo.getAdressDetails(params);
  }
}
