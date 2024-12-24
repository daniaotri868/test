// 🎯 Dart imports:
import 'dart:convert';
import 'dart:io';

// � Package imports:
import 'package:dio/dio.dart';
// � Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:restaurant_customer/features/app/data/repositories/prefs_repository_impl.dart';

import '../../enums/status_code_type.dart';

// 🌎 Project imports:

extension OptionsExtension on RequestOptions {}

enum _StatusType { succeed, failed }

class DioLogInterceptor extends Interceptor {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  final Logger logger = Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await StorageRepositoryImpl().token;

    // Fixed token
    // String token =
    //     "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjZlN2M2OTY5LTY1ZTktNDYyZS04NmVmLTA4ZGNlM2IzNzVmMSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkN1c3RvbWVyIiwiZXhwIjoxNzU5NjYxMDc0LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo1MjQ3LyIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNTAvIn0.FjKNTACLflAq4sLcMuCINfn8ED97YwKFez3O-8O6AoY";

    if (token != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    if (kDebugMode) {
      logger.i(
        "***|| ${options.method} ${options.uri} ||***"
        "\n param : ${options.queryParameters}"
        "\n Token : ${options.headers['Authorization']}"
        "\n data : ${options.data}",
      );
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      _StatusType statusType;
      if (response.statusCode == StatusCode.operationSucceeded.code) {
        statusType = _StatusType.succeed;
      } else {
        statusType = _StatusType.failed;
      }

      logger.f(
        "***|| INFO Response Request ${response.requestOptions.uri.path} ${statusType == _StatusType.succeed ? '✊' : ''} ||***"
        "\n Status code: ${response.statusCode}"
        "\n Status message: ${response.statusMessage}"
        "\n Data: ${encoder.convert(response.data)}",
      );
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      Logger(printer: PrettyPrinter(methodCount: 8)).e(
        "***|| ${err.requestOptions.uri.path} ||***"
        "\n response: ${err.response}"
        "\n message: ${err.message}"
        "\n type: ${err.type}",
        error: err.error,
        stackTrace: err.stackTrace,
      );
    }
    handler.next(err);
  }
}
