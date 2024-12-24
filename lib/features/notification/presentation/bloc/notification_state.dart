// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

class NotificationState {
  final PagingController<int, NotificationData> pagingController;

  NotificationState({PagingController<int, NotificationData>? pagingController})
      : pagingController =
            pagingController ?? PagingController(firstPageKey: 0);

  NotificationState copyWith(
      {PagingController<int, NotificationData>? pagingController}) {
    return NotificationState(
        pagingController: pagingController ?? this.pagingController);
  }

  List<Object> get props => [pagingController];
}
