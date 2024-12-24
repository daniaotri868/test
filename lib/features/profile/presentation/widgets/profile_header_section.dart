
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/generated/assets.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/controllers/app_bloc/app_bloc.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
 clipBehavior: Clip.none,
      children: [
        if(context.read<AppBloc>().state.isToken)
        Padding(
          padding: REdgeInsetsDirectional.only(top: 110),
          child: Container(
            height: 54.h,
            width: double.infinity,
            color: context.colorScheme.primary.withOpacity(.1),
            padding: REdgeInsetsDirectional.only(start: 26,top: 17,bottom: 17),
            child: AppText.bodyLarge(
              S.current.My_account,
              fontWeight: FontWeight.w500,
              color: context.colorScheme.profileTextColor,
            ),
          ),
        ),
        Padding(
          padding: REdgeInsetsDirectional.only(bottom: 20,start: context.read<AppBloc>().state.isToken?110:10,),
            child: const AppImage.asset(Assets.imagesProfileLogo,fit: BoxFit.fill,)),

      ],
    );
  }
}
