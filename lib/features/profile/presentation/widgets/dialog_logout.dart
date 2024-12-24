import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/app_button.dart';

import '../../../../common/models/page_state/bloc_status.dart';
import '../../../../generated/l10n.dart';
import '../../../../services/service_locator.dart';
import '../../../app/domain/repositories/prefs_repository.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../auth/presentation/pages/splash_page.dart';
import '../bloc/profile_bloc.dart';


class DialogLogout extends StatelessWidget {
  const DialogLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.verticalSpace,
          Icon(Icons.logout,color: context.colorScheme.primary,size: 30.r,),
          5.verticalSpace,
          AppText(
            style: context.textTheme.bodyMedium!.copyWith(
              color:
              context.colorScheme.primary
              ,
              fontSize: 20.sp
            ),
            S.current.D,
          ),
          10.verticalSpace,
          Padding(
            padding: REdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                    child: AppButton.dark(
                      onPressed: () {
                        context.pop(context);
                      },

                      title: S.current.Cancel,
                      style: ElevatedButton.styleFrom(
                          foregroundColor: context.colorScheme.onPrimary,
                          backgroundColor: context.colorScheme.error
                      ),
                    )
                ),
                5.horizontalSpace,
                Expanded(
                    child: BlocSelector<ProfileBloc,
                        ProfileState, BlocStatus>(
                      selector: (state) => state.logout,
                      builder: (context, state) {
                        return AppButton.dark(
                          isLoading: state.isLoading(),
                          onPressed: () {
                            context.read<ProfileBloc>().add(LogoutEvent(
                                onSuccess: () async {
                                  context.go(SplashPage.path);
                                  GetIt.I<StorageRepository>().clearUser();
                                }));
                          },
                          title: S.current.Confirm,
                          style: ElevatedButton.styleFrom(
                              foregroundColor: context.colorScheme.onPrimary,
                              backgroundColor: context.colorScheme.primary
                          ),
                        );
                      },
                    )
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
