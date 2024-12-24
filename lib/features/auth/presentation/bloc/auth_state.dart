part of 'auth_bloc.dart';

@immutable
class AuthState {
  final PageState registerRequest;
  final PageState addUserLocation;
  final PageState<AdressDetailsModel> getAdressDetails;
  const AuthState({
    this.registerRequest = const PageState.init(),
    this.addUserLocation = const PageState.init(),
    this.getAdressDetails = const PageState.init(),
  });

  AuthState copyWith({
    final PageState? registerRequest,
    final PageState? addUserLocation,
    final PageState<AdressDetailsModel>? getAdressDetails,
  }) {
    return AuthState(
      registerRequest: registerRequest ?? this.registerRequest,
      addUserLocation: addUserLocation ?? this.addUserLocation,
      getAdressDetails: getAdressDetails ?? this.getAdressDetails,
    );
  }
}
