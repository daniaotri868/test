import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/network/api_utils.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/app/data/data_source/app_remote_data_source.dart';
import 'package:restaurant_customer/features/app/data/models/initial_model.dart';
import 'package:restaurant_customer/features/app/domain/repositories/app_repo.dart';
import 'package:restaurant_customer/features/app/domain/use_case/initial_request_use_case.dart';



@Injectable(as: AppRepo)
class AppRepoImp extends AppRepo {
  final AppRemoteDataSource remoteDataSource;
  AppRepoImp(this.remoteDataSource);

  @override
  FutureResult<InitialModel> initialRequest(InitialParam param) {
    return toApiResult(
        () async => await remoteDataSource.initialRequest(param));
  }


}
