import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';
import 'package:restaurant_customer/features/auth/domain/repo/auth_repo.dart';

@injectable
class AddUserLocationUseCase extends UseCase<void, AddUserLocationParam> {
  final AuthRepo repo;
  AddUserLocationUseCase(this.repo);
  @override
  FutureResult call(AddUserLocationParam params) {
    return repo.addUserLocationStep(params);
  }
}

class AddUserLocationParam {
  final bool skip;
  final num? lat;
  final num? lon;
  final String? title;
  final String? building;
  final String? detail;

  AddUserLocationParam({
    required this.skip,
    this.lat = 0,
    this.lon = 0,
    this.title = '',
    this.building = '',
    this.detail = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'skip': skip,
      'lat': lat,
      'lon': lon,
      'title': title,
      'building': building,
      'detail': detail,
    };
  }
}
