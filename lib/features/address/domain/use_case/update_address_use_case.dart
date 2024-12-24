
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/utils/use_case.dart';
import '../../../profile/data/model/profile_model.dart';
import '../repositories/address_repo.dart';

@injectable
class UpdateAddressUseCase extends UseCase<void, UpdateAddressParam> {
  final AddressRepo _repository;
  UpdateAddressUseCase(this._repository);

  @override
  FutureResult call(UpdateAddressParam params)=>_repository.updateAddress(params);


}
class UpdateAddressParam {
  final num? lat;
  final num? lon;
  final String? title;
  final String? building;
  final String? detail;
final String id;
  UpdateAddressParam({
    this.lat,
    this.lon,
    this.title,
    this.building,
    this.detail,
    required this.id
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'lat': lat,
      'lon': lon,
      'title': title,
      'building': building,
      'detail': detail,
    };
  }
}
