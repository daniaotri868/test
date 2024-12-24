import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_customer/common/models/page_state/page_state.dart';
import 'package:restaurant_customer/features/auth/data/model/Adress_details_model.dart';
import 'package:restaurant_customer/features/auth/domain/use_case/add_user_location_use_case.dart';
import 'package:restaurant_customer/features/auth/domain/use_case/get_adress_details_use_case.dart';

import '../../../app/data/repositories/prefs_repository_impl.dart';
import '../../domain/use_case/register_request_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterRequestUseCase registerRequestUseCase;
  final AddUserLocationUseCase addUserLocationUseCase;
  final GetAdressDetailsUseCase getAdressDetailsUseCase;

  AuthBloc(
    this.registerRequestUseCase,
    this.addUserLocationUseCase,
    this.getAdressDetailsUseCase,
  ) : super(AuthState()) {
    on<RegisterRequestEvent>(_onRegisterRequestEvent);
    on<AddUserLocationEvent>(_onAddUserLocationEvent);
    on<GetAdressDetailsEvent>(_onGetAdressDetailsEvent);
  }


  FutureOr<void> _onRegisterRequestEvent(
      RegisterRequestEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(registerRequest: const PageState.loading()));
    final result = await registerRequestUseCase(event.param);
    result.fold(
      (left) {
        emit(state.copyWith(
            registerRequest:
                PageState.error(exception: left, message: left.message)));
      },
      (right) async {
        emit(state.copyWith(registerRequest: PageState.loaded(data: right)));
        await StorageRepositoryImpl().saveToken(right.token ?? "");
        await StorageRepositoryImpl().saveRefreshToken(right.refreshToken ?? '');
        event.onSuccess();
      },
    );
  }

  FutureOr<void> _onAddUserLocationEvent(
      AddUserLocationEvent event, Emitter<AuthState> emit) async {
    final result = await addUserLocationUseCase(event.param);
    result.fold(
      (left) {
        emit(state.copyWith(
            addUserLocation:
                PageState.error(exception: left, message: left.message)));
      },
      (right) {
        emit(state.copyWith(addUserLocation: PageState.loaded(data: right)));
        event.onSuccess();
      },
    );
  }

  FutureOr<void> _onGetAdressDetailsEvent(
      GetAdressDetailsEvent event, Emitter<AuthState> emit) async {
    final result = await getAdressDetailsUseCase(event.latLng);

    result.fold(
      (left) {
        emit(state.copyWith(
            getAdressDetails:
                PageState.error(exception: left, message: left.message)));
      },
      (right) {
        emit(state.copyWith(getAdressDetails: PageState.loaded(data: right)));
      },
    );
  }
}
