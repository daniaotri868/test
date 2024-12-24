import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/config/api_routes.dart';
import '../core/network/http_client.dart';
import '../core/network/interceptors/refresh_token_interceptor.dart';
import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => DioClient(
        baseUrl: ApiRoutes.baseUrlDev,
        interceptors: [
          RefreshTokenInterceptor(),
        ],
      );
}
