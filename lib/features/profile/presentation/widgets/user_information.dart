import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../pages/about_app.dart';
import 'list_tile_sections_profile.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 54.h,
          width: double.infinity,
          color: context.colorScheme.primary.withOpacity(.1),
          padding: REdgeInsetsDirectional.only(start: 26,top: 17,bottom: 17),
          child: AppText.bodyLarge(
            S.current.UserInformation,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.profileTextColor,
          ),
        ),
        ListTileSectionsProfile(
          onTap: (){},
          nameSection: S.current.PrivacyPolicy,
        ),
        ListTileSectionsProfile(
          onTap: (){
            context.pushNamed(AboutApp.name);
          },
          nameSection: S.current.AboutApp,
        ),
      ],
    );
  }
}
