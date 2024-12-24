import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/profile/presentation/widgets/switch_botton_tr.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_text.dart';

class GeneralSetting extends StatefulWidget {
   GeneralSetting({super.key});

  @override
  State<GeneralSetting> createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 54.h,
          width: double.infinity,
          color: context.colorScheme.primary.withOpacity(.1),
          padding: REdgeInsetsDirectional.only(start: 26,top: 17,bottom: 17),
          child: AppText.bodyLarge(
            S.current.GeneralSetting,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.profileTextColor,
          ),
        ),
        ListTile(

          trailing: const SwitchLanguage(),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText.regularText(
                S.current.Language,
                fontWeight: FontWeight.w400,
                color: context.colorScheme.onSurface.withOpacity(.7),
              ),

            ],
          ),
        ),
      ],
    );
  }

}
