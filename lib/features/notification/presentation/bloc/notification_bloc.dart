import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/helper/helper_function.dart';
import '../../data/models/all_notification_model.dart';
import '../../domain/usecases/change_status_notifications_usecase.dart';
import '../../domain/usecases/get_all_notification_usecase.dart';
part 'notification_event.dart';
part 'notification_state.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetAllNotificationUseCase getAllNotifications;
  final ChangeStatusNotificationsUsecase changeStatusNotifications;
  NotificationBloc(
      {required this.getAllNotifications,
      required this.changeStatusNotifications})
      : super(NotificationState()) {
    // 1
    on<GetAllNotificationEvent>((event, emit) async {
      final result = await getAllNotifications(event.params);
      emit(state.copyWith(
          pagingController: HelperFunctions.pageNationEitherStatus(
              either: result,
              pageKey: event.params.pageNumber,
              pagingController: state.pagingController)));
    });
    // 2
    on<ChangeStatusNotificationEvent>((event, emit) async {
      if (event.notification.isRead != true) {
        final result = await changeStatusNotifications(event.notification.id);
        result.fold((left) {}, (right) {
          List<NotificationData>? notifications =
              state.pagingController.itemList;
          final updatedNotification = event.notification.copyWith(isRead: true);
          notifications![event.index] = updatedNotification;
          state.pagingController.itemList = notifications;
          emit(state.copyWith(pagingController: state.pagingController));
        });
      }
    });
  }
}
