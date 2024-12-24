import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_button.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_image.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_scaffold.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_text.dart';
import 'package:restaurant_customer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:restaurant_customer/features/auth/presentation/pages/add_personal_info_page.dart';
import 'package:restaurant_customer/features/home/presentaion/pages/home.dart';
import 'package:restaurant_customer/generated/l10n.dart';

import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../app/presentation/controllers/app_bloc/app_bloc.dart';
import '../../services/auth_service.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String get name => "/RegisterPage";
  static String get path => "/RegisterPage";

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: AppImage.asset(
                Assets.svg.backeGroundLongIn,
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              top: 90.h,
              child: Column(
                children: [
                  AppImage.asset(
                    Assets.images.appLogo.path,
                    size: 145,
                  ),
                  18.verticalSpace,
                  AppText(
                    S.of(context).Restaurant_application,
                    style: context.textTheme.titleLarge!.copyWith(),
                    color: context.colorScheme.primary,
                  ),
                  20.verticalSpace,
                  AppText(
                    S.of(context).For_fast_food,
                    style: context.textTheme.titleSmall!.copyWith(fontSize: 16),
                    color: context.colorScheme.onSurface,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: REdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton.dark(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: context.colorScheme.primary,
                        backgroundColor: context.colorScheme.onPrimary,
                        textStyle: context.textTheme.titleSmall,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.r),
                        ),
                      ),
                      onPressed: () async {
                         final result = await AuthService().signInWithGoogle();
                        context.go(AddPersonalInfoPage.path,
                            extra: result.user?.email);
                         context.read<AppBloc>().add(SetStatusToken(true));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            S.of(context).Sign_in_with_Google,
                          ),
                          17.horizontalSpace,
                          AppImage.asset(
                            Assets.svg.googleIcon,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: AppButton.dark(
                        style: ElevatedButton.styleFrom(

                          backgroundColor:  context.colorScheme.primary.withOpacity(.5),
                          textStyle: context.textTheme.titleSmall,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36.r),
                          ),
                        ),
                        onPressed: () async {
                          context.read<AppBloc>().add(SetStatusToken(false));
                      context.go(Home.path);
                        },
                        child: AppText(
                          S.current.Log_in_to_browse,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
}
