part of 'home_bloc.dart';

@immutable
class HomeState {
  final PageState<HomeModel> getAllHomeData;
  final StoresItem? storeSelected;
  final int? unReadNotificationCount;
  const HomeState({
    this.getAllHomeData = const PageState.init(),
    this.storeSelected,
    this.unReadNotificationCount,
  });

  HomeState copyWith({
    final PageState<HomeModel>? getAllHomeData,
    //final int? cartCount,
    final StoresItem? storeSelected,
    final int? unReadNotificationCount,
  }) {
    return HomeState(
      getAllHomeData: getAllHomeData ?? this.getAllHomeData,
      storeSelected: storeSelected ?? this.storeSelected,
      unReadNotificationCount:
          unReadNotificationCount ?? this.unReadNotificationCount,
    );
  }
}
