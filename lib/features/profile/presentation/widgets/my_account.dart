import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/profile/data/model/profile_model.dart';
import 'package:restaurant_customer/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../order/presentation/pages/order_page.dart';
import '../pages/my_account_page.dart';
import '../pages/my_address.dart';
import '../pages/my_coupon.dart';
import 'list_tile_sections_profile.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key, required this.data,required this.bloc});
final ProfileModel data;
final ProfileBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         InkWell(
           onTap: () => context.pushNamed(MyAccountPage.name,extra: ProfileParam(data: data,bloc: bloc)),
           child: ListTile(
             leading: CircleAvatar(backgroundColor:Colors.grey.shade200,child: Icon(Icons.person,color: context.colorScheme.profileTextColor,)),
             trailing: Icon(Icons.arrow_forward_ios,
            color: context.colorScheme.profileTextColor,
             ),
             title: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 AppText.bodyLarge(
                   '${data.firstName} ${data.lastName}',
                   fontWeight: FontWeight.w500,
                 ),
                 AppText.regularText(
                   data.email??'',

                   fontWeight: FontWeight.w500,
                   color: context.colorScheme.profileTextColor,
                 )
               ],
             ),
           ),
         ),
        ListTileSectionsProfile(
          onTap: (){
            context.pushNamed(OrderPage.name);

          },
          nameSection: S.current.MyOrder,
        ),
        ListTileSectionsProfile(
          onTap: (){
            context.pushNamed(MyAddress.name);
          },
          nameSection: S.current.MyAddress,
        ),
        ListTileSectionsProfile(
          onTap: (){
            context.pushNamed(MyCoupon.name);
          },
          nameSection: S.current.MyCoupons,
        ),
        18.verticalSpace,
      ],
    );
  }
}
