import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:either_dart/either.dart';

import '../../features/app/presentation/widgets/app_toast.dart';
import '../error/app_exception.dart';

Future<T> throwAppException<T>(FutureOr<T> Function() call) async {
  try {
    return (await call());
  } on AppException catch (e) {
    showMessage(e.message);
    rethrow;
  }
  on SocketException catch (e) {
    showMessage(AppNetworkExceptionReason.noInternet.message);
    throw AppNetworkException(
        message: e.message,
        reason: AppNetworkExceptionReason.noInternet,
        exception: e);
  }
  on Exception catch (e) {
    showMessage(e.toString());

    throw AppException.unknown(exception: e, message: e.toString());
  } catch (e, s) {
    showMessage(e.toString());

    log(e.toString(), stackTrace: s);
    throw AppException.unknown(exception: e, message: e.toString());
  }
}

void showMessage(String message, {bool isSuccess = false}) =>
    AppToasts.showFailureMessage(message);

Future<Either<AppException, T>> toApiResult<T>(
    FutureOr<T> Function() call) async {
  try {
    return Right(await call());
  } on AppNetworkResponseException catch (e) {
    if (e.data is! String) {
      return Left(e);
    }
    return Left(e);
  } on AppNetworkException catch (e) {
    final message = e.message;
    final appNetworkException = e.copyWith(message: message);
    return Left(appNetworkException);
  } on AppException catch (e) {
    return Left(e);
  } catch (e, s) {
    log(e.toString(), stackTrace: s);
    final exception = AppException.unknown(exception: e, message: e.toString());
    return Left(exception);
  }
}
