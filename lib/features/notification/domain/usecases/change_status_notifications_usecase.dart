import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';
import '../../../../core/utils/types.dart';
import '../repositories/notification_repository.dart';

@injectable
class ChangeStatusNotificationsUsecase extends UseCase<bool, String> {
  final NotificationRepository repo;
  ChangeStatusNotificationsUsecase(this.repo);
  @override
  FutureResult<bool> call(String params) async {
    return repo.changeStatusNotification(params);
  }
}
