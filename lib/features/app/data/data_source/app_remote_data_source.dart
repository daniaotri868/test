import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/config/api_routes.dart';
import 'package:restaurant_customer/core/network/api_utils.dart';
import 'package:restaurant_customer/features/app/data/models/initial_model.dart';
import 'package:restaurant_customer/features/app/domain/use_case/initial_request_use_case.dart';


@injectable
class AppRemoteDataSource {
  final Dio dio;

  AppRemoteDataSource({required this.dio});

  Future<InitialModel> initialRequest(InitialParam param) async {
    return await throwAppException(() async {
      final result =
          await dio.post(ApiRoutes.auth.initialRequest, data: param.toMap());
      return InitialModel.fromJson(result.data);
    });
  }


}
