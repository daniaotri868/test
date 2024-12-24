import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/features/app/presentation/controllers/app_bloc/app_bloc.dart';
import 'package:restaurant_customer/generated/l10n.dart';

import '../../../../core/config/theme/extension.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../app/data/repositories/prefs_repository_impl.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../home/presentaion/pages/home.dart';
import 'welcom_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String get name => "/SplashPage";
  static String get path => "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(InitialRequestEvent());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await check();
    });
  }

  Future<void> check() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go(
        await StorageRepositoryImpl().token == null ? Welcome.path : Home.path,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AppImage.asset(
              Assets.svg.backgroudSplash,
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImage.asset(
                  Assets.images.appLogo.path,
                  size: 200.h,
                ),
                AppText(
                  S.of(context).Restaurant_application,
                  style: context.textTheme.headlineLarge!.copyWith(),
                  color: context.colorScheme.primary,
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 540.h,
            left: 80.w,
            child: AppText(
              S.of(context).For_fast_food,
              style: context.textTheme.displaySmall!.copyWith(
                  fontFamily: Assets.fonts.gothic.iTCHandelGothicArabicLight),
              color: context.colorScheme.onSurface,
            ),
          )
        ],
      ),
    );
  }
}
