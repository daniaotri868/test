import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/config/api_routes.dart';
import '../../../../core/network/api_utils.dart';
import '../../domain/use_case/home_usecase.dart';
import '../models/home_model.dart';

@injectable
class HomeRemoteDataSource {
  HomeRemoteDataSource({required this.dio});
  final Dio dio;


Future<HomeModel> getHome(HomeParams params) async {
  return throwAppException(() async {
    final result = await dio.get(ApiRoutes.home.getAllHome,queryParameters: params.toMap());
    return HomeModel.fromJson(result.data);
  });
  }


}
