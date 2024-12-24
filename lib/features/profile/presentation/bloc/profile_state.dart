part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final PageState<ProfileModel> getProfileState;
  final PageState<List<CouponModel>> getAllCouponState;
  final BlocStatus logout;
  final BlocStatus updateProfile;
  const ProfileState({
    this.getProfileState = const PageState.init(),
    this.getAllCouponState=const PageState.init(),
    this.logout=const BlocStatus.initial(),
    this.updateProfile=const BlocStatus.initial(),

  });

  ProfileState copyWith({
    final PageState<ProfileModel>? getProfileState,
    final PageState<List<CouponModel>>? getAllCouponState,
    final BlocStatus? logout,
    final BlocStatus?updateProfile
  }) {
    return ProfileState(
      getProfileState: getProfileState ?? this.getProfileState,
        getAllCouponState:getAllCouponState??this.getAllCouponState,
      updateProfile: updateProfile??this.updateProfile
    );
  }
}
