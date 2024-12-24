import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/features/home/presentaion/pages/home.dart';
import 'package:restaurant_customer/generated/l10n.dart';

import '../../../../core/config/theme/extension.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../services/service_locator.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../domain/use_case/add_user_location_use_case.dart';
import '../bloc/auth_bloc.dart';
import 'set_location_page.dart';

class AllowLocationPage extends StatefulWidget {
  const AllowLocationPage({super.key});
  static String get name => "/AllowLocationPage";
  static String get path => "/AllowLocationPage";

  @override
  State<AllowLocationPage> createState() => _AllowLocationPageState();
}

class _AllowLocationPageState extends State<AllowLocationPage> {
  final AuthBloc bloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: AppScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                AppImage.asset(
                  Assets.images.appLogo.path,
                  height: 111.h,
                  width: 111.w,
                ),
                10.verticalSpace,
                AppText(
                  S.of(context).Locate,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: const Color(0xFf404040),
                  ),
                ),
                15.verticalSpace,
                SizedBox(
                  width: 220.w,
                  child: AppText(
                    textAlign: TextAlign.center,
                    S
                        .of(context)
                        .Allow_the_app_to_determine_your_current_location,
                    style:
                        context.textTheme.labelMedium!.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 180.w,
                  child: AppButton.dark(
                    title: S.of(context).select,
                    onPressed: () {
                      context.push(SetLocationPage.path);
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.goNamed(Home.name);
                    bloc.add(AddUserLocationEvent(
                      param: AddUserLocationParam(
                        skip: true,
                      ),
                      onSuccess: () {
                        context.goNamed(Home.path);
                      },
                    ));
                  },
                  child: AppText(
                    S.of(context).skip,
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                    color: context.colorScheme.shadow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
