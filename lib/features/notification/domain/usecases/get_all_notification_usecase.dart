import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';
import '../../../../core/utils/types.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../data/models/all_notification_model.dart';
import '../repositories/notification_repository.dart';

@injectable
class GetAllNotificationUseCase
    extends UseCase<PaginationModel<NotificationData>, AllNotificationsParams> {
  final NotificationRepository repo;
  GetAllNotificationUseCase(this.repo);
  @override
  FutureResult<PaginationModel<NotificationData>> call(AllNotificationsParams params) async {
    return repo.getAllNotification(params);
  }
}

class AllNotificationsParams {
  final int? pageSize;
  final int pageNumber;

  AllNotificationsParams({this.pageSize = 13, required this.pageNumber});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'PageSize': pageSize, 'PageNumber': pageNumber};
  }

  String toJson() => json.encode(toMap());
}
