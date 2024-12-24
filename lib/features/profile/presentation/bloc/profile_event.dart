part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {

  GetProfileEvent();
}




class GetAllCouponEvent extends ProfileEvent {
 final bool status;
  GetAllCouponEvent({required this.status});
}

class LogoutEvent extends ProfileEvent {
  final VoidCallback onSuccess;

  LogoutEvent({required this.onSuccess});
}

class UpdateProfileEvent extends ProfileEvent {
  final VoidCallback onSuccess;
final UpdateProfileeParam param;
  UpdateProfileEvent({required this.onSuccess,required this.param});
}
