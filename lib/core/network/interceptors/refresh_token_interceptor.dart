import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import '../../../features/app/data/models/refresh_token_model.dart';
import '../../../features/app/domain/repositories/prefs_repository.dart';
import '../../../features/app/presentation/controllers/app_bloc/app_bloc.dart';
import '../../../features/auth/presentation/pages/register_page.dart';
import '../../../services/navigation/router.dart';
import '../../config/api_routes.dart';
import '../../enums/status_code_type.dart';
import '../../error/app_exception.dart';
import '../api_utils.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  bool isRefreshToken = false;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await GetIt.I<StorageRepository>().token;
    if (token != null && !isRefreshToken) {
      print(token);
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    // options.headers[HttpHeaders.acceptLanguageHeader] =
    //     LanguageService.languageCode;

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    if (statusCode == StatusCode.unAuthorized.code) {
      isRefreshToken = true;
      bool result = await refreshToken();
      if (result) {
        err.requestOptions.headers[HttpHeaders.authorizationHeader] =
            'Bearer ${await GetIt.I<StorageRepository>().token}';
        return handler.resolve(await GetIt.I<Dio>().fetch(err.requestOptions));
      }

      return handler.next(err);
    }
    return handler.next(err);
  }

  Future<bool> refreshToken() async {
    Either<dynamic, RefreshToeknModel> result = await toApiResult(
      () => throwAppException(() async {
        final result = await GetIt.I<Dio>().post(ApiRoutes.auth.refreshToken,
            data: {
              "refreshToken": await GetIt.I<StorageRepository>().refreshToken
            });
        return RefreshToeknModel.fromJson(result.data);
      }),
    );

    return await result.fold(
      (l) async {
        if (l is AppNetworkException) {
          if (l.noInternetConnection) {
          } else {
            await GetIt.I.resetLazySingleton<Dio>();
            await Future.wait([
              GetIt.I<StorageRepository>().clearUser(),
              FirebaseMessaging.instance.deleteToken(),
            ]);
            GetIt.I<AppBloc>().add(ResetAfterLogout());
            router.go(RegisterPage.path);
          }
        }
        return false;
      },
      (r) async {
        if (r.token == null || r.refreshToken == null) {
          return false;
        }

        await Future.wait([
          GetIt.I<StorageRepository>().saveToken(r.token!),
          GetIt.I<StorageRepository>().saveRefreshToken(r.refreshToken!)
        ]);

        return true;
      },
    );
  }
}
