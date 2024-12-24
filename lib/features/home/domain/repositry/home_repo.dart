import '../../../../core/utils/types.dart';
import '../../data/models/home_model.dart';
import '../use_case/home_usecase.dart';


abstract class HomeRepository {
  FutureResult<HomeModel> home(HomeParams params);

}
