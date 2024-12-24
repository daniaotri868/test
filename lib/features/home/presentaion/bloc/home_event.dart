part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeDataEvent extends HomeEvent {
  final double? late;
  final double? long;

  GetHomeDataEvent({this.long, this.late});
}

class SaveStoreEvent extends HomeEvent {
  final StoresItem storesItem;

  SaveStoreEvent({required this.storesItem});
}

class CancelNotificationNumberEvent extends HomeEvent {}
