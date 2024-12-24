import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_customer/common/models/page_state/bloc_status.dart';
import 'package:restaurant_customer/features/profile/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/profile/data/model/profile_model.dart';
import 'package:restaurant_customer/features/profile/domain/use_case/get_profile_use_case.dart';

import '../../../../common/models/page_state/page_state.dart';
import '../../../../core/helper/helper_function.dart';

import '../../domain/use_case/get_all_coupon_use_case.dart';
import '../../domain/use_case/logout_use_case.dart';
import '../../domain/use_case/update_profile_use_case.dart';

part 'profile_event.dart';

part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final GetAllCouponUseCase getAllCouponUseCase;
  final LogoutUseCase logoutUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  ProfileBloc(this.getProfileUseCase, this.getAllCouponUseCase, this.logoutUseCase, this.updateProfileUseCase) : super(const ProfileState()) {
    on<GetProfileEvent>(_onGetCartEvent);
    on<GetAllCouponEvent>(_onGetAllCouponEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<UpdateProfileEvent>(_onUpdteProfileEvent);

  }
  Future<void> _onUpdteProfileEvent(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(updateProfile: const BlocStatus.loading()));
    final result = await updateProfileUseCase(event.param);
    emit(state.copyWith(
        updateProfile: HelperFunctions.mapEitherToBlocStatus(
            either: result,
            onSuccess: event.onSuccess
        )));
  }


  Future<void> _onLogoutEvent(LogoutEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(logout: const BlocStatus.loading()));
    final result = await logoutUseCase();
    emit(state.copyWith(
        logout: HelperFunctions.mapEitherToBlocStatus(
            either: result,
            onSuccess: event.onSuccess
        )));
  }

  Future<void> _onGetAllCouponEvent(GetAllCouponEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(getAllCouponState: const PageState.loading()));
    final result = await getAllCouponUseCase(event.status);

    emit(state.copyWith(
        getAllCouponState: HelperFunctions.mapEitherToPageState(
          either: result,
          emptyChecker: (data) {
            if (data.isEmpty) return true;
            return false;
          },
        )));
  }



  Future<void> _onGetCartEvent(ProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(getProfileState: const PageState.loading()));
    final result = await getProfileUseCase();

    emit(state.copyWith(
        getProfileState: HelperFunctions.mapEitherToPageState(
      either: result,

    )));
  }



}
