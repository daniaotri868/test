part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class RegisterRequestEvent extends AuthEvent {
  final RegisterParam param;
  final VoidCallback onSuccess;
  RegisterRequestEvent({required this.param, required this.onSuccess});
}

class AddUserLocationEvent extends AuthEvent {
  final AddUserLocationParam param;
  final VoidCallback onSuccess;
  AddUserLocationEvent({required this.param, required this.onSuccess});
}

class GetAdressDetailsEvent extends AuthEvent {
  final LatLng latLng;
  GetAdressDetailsEvent(this.latLng);
}

