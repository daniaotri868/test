import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/page_state/page_state.dart';
import '../../../../core/helper/helper_function.dart';
import '../../data/models/home_model.dart';

import '../../data/models/stores_section_model.dart';
import '../../domain/use_case/home_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc(
    this.homeUseCase,
  ) : super(HomeState()) {
    on<GetHomeDataEvent>(_onGetHomeDataEvent);
    on<SaveStoreEvent>(_onSaveStoreEvent);
    on<CancelNotificationNumberEvent>(_onCancelNotificationNumberEvent);
  }

  Future<void> _onGetHomeDataEvent(
      GetHomeDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(getAllHomeData: const PageState.loading()));
    final result = await homeUseCase(
        HomeParams(lat: event.late ?? 0, long: event.long ?? 0));
    emit(state.copyWith(
        getAllHomeData: HelperFunctions.mapEitherToPageState(
      either: result,
    )));
    emit(state.copyWith(
      storeSelected: state.getAllHomeData.getDataWhenSuccess?.minDistanceStore,
      unReadNotificationCount:
          state.getAllHomeData.getDataWhenSuccess?.unReadNotificationCount,
    ));
  }

  Future<void> _onSaveStoreEvent(
      SaveStoreEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(storeSelected: event.storesItem));
  }

  Future<void> _onCancelNotificationNumberEvent(
      CancelNotificationNumberEvent event, Emitter emit) async {
    emit(state.copyWith(unReadNotificationCount: 0));
  }
}
