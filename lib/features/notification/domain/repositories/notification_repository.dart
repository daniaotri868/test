import 'package:restaurant_customer/features/notification/data/models/all_notification_model.dart';
import '../../../../core/utils/types.dart';
import '../../../app/data/models/pagination_model.dart';
import '../usecases/get_all_notification_usecase.dart';

abstract class NotificationRepository {
  FutureResult<PaginationModel<NotificationData>> getAllNotification(AllNotificationsParams params);
  FutureResult<bool> changeStatusNotification(String params);
}