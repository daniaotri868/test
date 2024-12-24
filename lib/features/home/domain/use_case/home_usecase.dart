

import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import '../../../../core/utils/use_case.dart';
import '../../data/models/home_model.dart';
import '../repositry/home_repo.dart';

@injectable
class HomeUseCase implements UseCase<HomeModel, HomeParams> {
  final HomeRepository repository;

  HomeUseCase({required this.repository});

  @override
  FutureResult<HomeModel> call(params) async {
    return repository.home(params);
  }
}

class HomeParams {
  final double lat;
  final double long;

  HomeParams({
    required this.long,
    required this.lat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Lat': lat,
      'Long': long,
    };
  }


}
