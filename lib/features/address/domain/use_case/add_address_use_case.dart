
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';
import 'package:restaurant_customer/generated/l10n.dart';

import '../../../../core/utils/use_case.dart';
import '../../../profile/data/model/profile_model.dart';
import '../repositories/address_repo.dart';

@injectable
class AddAddressUseCase extends UseCase<String, AddAddressParam> {
  final AddressRepo _repository;
  AddAddressUseCase(this._repository);

  @override
  FutureResult<String> call(AddAddressParam params)=>_repository.addAddress(params);


}
class AddAddressParam {
  final num? lat;
  final num? lon;
  final String? title;
  final String? building;
  final String? detail;

  AddAddressParam({
    this.lat,
    this.lon,
    this.title,
    this.building,
    this.detail,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'title': title,
      'building': building,
      'detail': detail,
    };
  }
}
