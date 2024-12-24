import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/config/api_routes.dart';
import '../../../../core/network/api_utils.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../domain/usecases/get_all_notification_usecase.dart';
import '../models/all_notification_model.dart';

@injectable
class NotificationRemoteDataSource {
  NotificationRemoteDataSource({required this.dio});
  final Dio dio;

  Future<PaginationModel<NotificationData>> getAllNotification(
      AllNotificationsParams params) async {
    return await throwAppException(() async {
      final response = await dio.get(ApiRoutes.notification.getNotification,
          queryParameters: params.toMap());
      return PaginationModel<NotificationData>.fromJson(
          response.data, (json) => NotificationData.fromJson(json));
    });
  }

  Future<bool> changeStatusNotification(String data) async {
    return await throwAppException(() async {
      final ids = {
        "ids": [data]
      };
      final response =
          await dio.put(ApiRoutes.notification.readNotification, data: ids);
      if (response.statusCode == 204) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    });
  }
}
