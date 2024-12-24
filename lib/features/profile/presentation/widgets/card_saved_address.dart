import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:restaurant_customer/generated/assets.dart';

import '../../../address/data/models/address_model.dart';
import '../../../address/presentation/controllers/address_bloc/address_bloc.dart';
import '../../../address/presentation/pages/location_page.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';

class CardSavedAddress extends StatelessWidget {
  const CardSavedAddress({super.key, required this.data});
 final AddressModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsetsDirectional.only(start:23,end: 23,top: 10 ),
      padding: REdgeInsetsDirectional.only(start: 10,end: 10,top: 5,bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage.asset(
            Assets.imagesIconLocation,
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                 data.addressTitle??'',
                  style: context.textTheme.bodyLarge!.copyWith(
                      color: context.colorScheme.shadow,
                      overflow: TextOverflow.ellipsis),
                ),
                5.verticalSpace,
                AppText.bodySmall(
                  data.street??'',
                fontWeight: FontWeight.normal,

                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.read<AddressBloc>().add(DeleteAddressEvent(id: data.id, onSuccess: (){context.read<AddressBloc>().add(GetAllAddressEvent());})),
                  child: Icon(Icons.close,color: Colors.red,size: 25.r,)),
              40.verticalSpace,
              GestureDetector(
                onTap: () => context.pushNamed(LocationPage.name,extra: AddLocationPageParams(locationModel:AddressModel(lon: data.lon,building: data.building,detail: data.detail,lat: data.lat,addressTitle: data.addressTitle,id: data.id,street: data.street, city: data.city, customerId: data.customerId ),profileOrCart: true)),
                  child: Icon(Icons.edit_sharp,color: context.colorScheme.primary,size: 25.r,)),
            ],
          )
          // const Spacer(),
        ],
      ),
    );
  }
}
