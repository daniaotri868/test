import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:restaurant_customer/features/app/presentation/controllers/app_bloc/app_bloc.dart';
import 'package:restaurant_customer/services/service_locator.dart';
import 'package:restaurant_customer/services/service_provider.dart';
import 'package:restaurant_customer/services/storage_service/storage_key.dart';
import 'package:restaurant_customer/services/storage_service/storage_service.dart';

import 'common/constant/configuration/prefs_key.dart';
import 'core/color_scheme/dark_color_scheme.dart';
import 'core/color_scheme/light_color_scheme.dart';
import 'core/config/theme/app_theme.dart';

import 'features/app/domain/repositories/prefs_repository.dart';
import 'features/app/presentation/widgets/app_progress_indicator.dart';
import 'features/app/presentation/widgets/dismiss_keyboard_gesture_detector_wrapper.dart';
import 'generated/l10n.dart';
import 'services/language_service.dart';
import 'services/navigation/router.dart';
import 'services/notification_service/notification_handler.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? lang;

  @override
  void initState() {
    super.initState();
  }

  void getLanguage(BuildContext blocContext) async {
    lang = await getIt<StorageRepository>().getLanguage;
    blocContext.read<AppBloc>().add(LanguageChanged(language: lang ?? 'ar'));
  }

  @override
  Widget build(BuildContext context) {
    NotificationHandler.initialize;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: false,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          final theme = AppTheme.init(
            darkColorScheme: darkColorScheme,
            lightColorScheme: lightColorScheme,
          );
          return GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayWidgetBuilder: (progress) => const AppProgressIndicator(
                color: Color(0xFFFB5607), size: 75, strokeWidth: 7),
            child: DismissKeyboardGestureDetectorWrapper(
              child: ValueListenableBuilder(
                valueListenable: HiveService.hiveBox.listenable(),
                builder: (context, value, child) => ServiceProvider(
                  child: BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      getLanguage(context);

                      return MaterialApp.router(
                        routerConfig: router,
                        builder: (context, child) {
                          return ResponsiveBreakpoints.builder(
                            child: child!,
                            breakpoints: [
                              const Breakpoint(
                                  start: 0, end: 450, name: MOBILE),
                              const Breakpoint(
                                  start: 451, end: 800, name: TABLET),
                              const Breakpoint(
                                  start: 801, end: 1920, name: DESKTOP),
                              const Breakpoint(
                                  start: 1921,
                                  end: double.infinity,
                                  name: '4K'),
                            ],
                          );
                        },
                        title: "Restaurant",
                        theme: theme.lightTheme,
                        debugShowCheckedModeBanner: false,
                        locale: Locale(state.language ?? 'ar'),
                        // locale: const Locale('en'),
                        localizationsDelegates: const [
                          S.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: LanguageService.supportedLocales,
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
