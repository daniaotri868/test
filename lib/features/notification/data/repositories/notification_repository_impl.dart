import 'package:injectable/injectable.dart';
import '../../../../core/network/api_utils.dart';
import '../../../../core/utils/types.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../domain/repositories/notification_repository.dart';
import '../../domain/usecases/get_all_notification_usecase.dart';
import '../datasoueces/notification_remote_data_source.dart';
import '../models/all_notification_model.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImp implements NotificationRepository {
  final  NotificationRemoteDataSource dataSource;
 NotificationRepositoryImp({required this.dataSource});

  
  @override
  FutureResult<PaginationModel<NotificationData>> getAllNotification(AllNotificationsParams params) {
 return toApiResult(() => dataSource.getAllNotification(params));
  }

  @override
  FutureResult<bool> changeStatusNotification(String params) {
    return toApiResult(() => dataSource.changeStatusNotification(params));
  }}