// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

sealed class NotificationEvent {}

class GetAllNotificationEvent extends NotificationEvent {
  AllNotificationsParams params;
  GetAllNotificationEvent({required this.params});
}

class ChangeStatusNotificationEvent extends NotificationEvent {
  final NotificationData notification;
  final int index;
  ChangeStatusNotificationEvent(
      {required this.notification, required this.index});
}
