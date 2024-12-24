import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/app/data/models/initial_model.dart';
import 'package:restaurant_customer/features/app/domain/use_case/initial_request_use_case.dart';


abstract class AppRepo {
  FutureResult<InitialModel> initialRequest(InitialParam param);


}
