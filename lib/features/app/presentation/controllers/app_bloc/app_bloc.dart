import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
// import 'package:restaurant_customer/features/app/data/repositories/prefs_repository_impl.dart';
// import 'package:restaurant_customer/features/app/domain/use_case/refresh_token_use_case.dart';

import '../../../../../common/models/page_state/page_state.dart';
import '../../../../../core/helper/helper_function.dart';
import '../../../../../services/language_service.dart';
import '../../../../../services/service_locator.dart';
import '../../../domain/repositories/prefs_repository.dart';
import '../../../domain/use_case/initial_request_use_case.dart';

part 'app_event.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final InitialRequestUseCase initialRequestUseCase;

  AppBloc(
    this.initialRequestUseCase,
  ) : super(AppState()) {
    on<ChangeTheme>(_onChangeTheme);
    on<LanguageChanged>(_onLanguageChanged);
    on<ResetAfterLogout>(_onResetAfterLogout);
    on<InitialRequestEvent>(_onInitialRequestEvent);
    on<SetStatusToken>(_onSetStatusToken);
  }
 _onSetStatusToken(
      SetStatusToken event, Emitter<AppState> emit)
  async{
    emit(state.copyWith(
        isToken: event.isToken
    ));
  }
  _onResetAfterLogout(
    ResetAfterLogout event,
    Emitter<AppState> emit,
  ) {
    emit(AppState());
  }

  _onLanguageChanged(
    LanguageChanged event,
    Emitter<AppState> emit,
  ) {
    if (event.language != state.language) {
      getIt<StorageRepository>().saveLanguage(event.language);

      emit(state.copyWith(language: event.language));
    }
  }

  _onChangeTheme(
    ChangeTheme event,
    Emitter<AppState> emit,
  ) async {
    await GetIt.I<StorageRepository>().saveTheme(event.themeMode);
    emit(state.copyWith(mode: event.themeMode));
  }

  FutureOr<void> _onInitialRequestEvent(
      InitialRequestEvent event, Emitter<AppState> emit) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    print('inside event');

    final result = await initialRequestUseCase.call(InitialParam(
      language: state.language.toString(),
      iosBuildName: packageInfo.appName,
      iosBuildNumber: int.parse(packageInfo.buildNumber),
      androidVersionCode: int.parse(packageInfo.buildNumber),
      deviceId: await HelperFunctions.getDeviceId()??"",
    ));
    result.fold(
      (left) {
        emit(state.copyWith(
            initialRequestStatus:
                PageState.error(exception: left, message: left)));
      },
      (right) {
        emit(state.copyWith(
            initialRequestStatus: PageState.loaded(data: right)));
      },
    );
  }
}
