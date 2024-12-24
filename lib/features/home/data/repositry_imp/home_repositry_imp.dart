import 'package:injectable/injectable.dart';
import '../../../../core/network/api_utils.dart';
import '../../../../core/utils/types.dart';
import '../../domain/repositry/home_repo.dart';
import '../../domain/use_case/home_usecase.dart';
import '../data_source/home_remote_datasource.dart';
import '../models/home_model.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp extends HomeRepository {
  final HomeRemoteDataSource dataSource;
  HomeRepositoryImp({required this.dataSource});


  @override
  FutureResult<HomeModel> home(HomeParams params) => toApiResult(() async=> dataSource.getHome(params));



}
