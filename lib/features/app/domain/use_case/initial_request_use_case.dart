import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';
import 'package:restaurant_customer/features/app/data/models/initial_model.dart';
import 'package:restaurant_customer/features/app/domain/repositories/app_repo.dart';

@injectable
class InitialRequestUseCase extends UseCase<InitialModel, InitialParam> {
  final AppRepo repo;
  InitialRequestUseCase(this.repo);
  @override
  FutureResult<InitialModel> call(InitialParam params) {
    return repo.initialRequest(params);
  }
}

class InitialParam {
  final String language;
  final String iosBuildName;
  final int iosBuildNumber;
  final int androidVersionCode;
  final String deviceId;

  InitialParam({
    required this.language,
    required this.iosBuildName,
    required this.iosBuildNumber,
    required this.androidVersionCode,
    required this.deviceId,
  });

  Map<String, dynamic> toMap() {
    return {
      'language': language,
      'iosBuildName': iosBuildName,
      'iosBuildNumber': iosBuildNumber,
      'androidVersionCode': androidVersionCode,
      'deviceId': deviceId,
    };
  }
}
