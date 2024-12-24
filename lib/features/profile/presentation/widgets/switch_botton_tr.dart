import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/controllers/app_bloc/app_bloc.dart';
import 'package:restaurant_customer/features/auth/presentation/pages/splash_page.dart';

import '../../../../services/service_locator.dart';
import '../../../app/domain/repositories/prefs_repository.dart';


class SwitchLanguage extends StatefulWidget {
  const SwitchLanguage({super.key});

  @override
  State<SwitchLanguage> createState() => _SwitchLanguageState();
}

class _SwitchLanguageState extends State<SwitchLanguage> {
  bool isActiveEn = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(left: 12),
      height: 30.h,
      width: 90.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: context.colorScheme.outline.withOpacity(.5)
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: TextButton(
                onPressed: () async {

                  setState(() {
                    isActiveEn = !isActiveEn;

                  });
                  context.read<AppBloc>().add(LanguageChanged(language: 'en'));

                },
                style:
                    TextButton.styleFrom(padding: EdgeInsetsDirectional.zero),
                child: Container(
                  height: 22.h,
                  width: 33.w,
                  padding: REdgeInsetsDirectional.only(top: 5),

                  decoration: BoxDecoration(
                    color: isActiveEn
                        ? context.colorScheme.primary
                        : context.colorScheme.outline.withOpacity(.5),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    'EN',
                    style: isActiveEn
                        ? context.textTheme.titleSmall!.copyWith(
                            color: context.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          )
                        : context.textTheme.titleSmall!
                            .copyWith(color: context.colorScheme.onSurface.withOpacity(.66)),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Flexible(
            flex: 3,
            child: TextButton(
                onPressed: () async {

                  setState(() {
                 isActiveEn = !isActiveEn;

               });

             context.read<AppBloc>().add(LanguageChanged(language: 'ar'));
                  },
                style:
                    TextButton.styleFrom(padding: EdgeInsetsDirectional.zero),
                child: Container(
                  height: 22.h,
                  width: 33.w,
                  padding: REdgeInsetsDirectional.only(top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: !isActiveEn
                        ? context.colorScheme.primary
                        :context.colorScheme.outline.withOpacity(.5),
                  ),
                  child: Text(
                    'AR',
                    style: !isActiveEn
                        ? context.textTheme.titleSmall!.copyWith(
                            color: context.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          )
                        : context.textTheme.titleSmall!
                            .copyWith(color: context.colorScheme.onSurface.withOpacity(.6)),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
