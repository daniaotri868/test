
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_customer/common/models/page_state/page_state.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/utils/extensions/form_builder.dart';
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/cart_page.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/saved_address_page.dart';
import 'package:restaurant_customer/features/profile/presentation/pages/my_address.dart';
import 'package:restaurant_customer/services/service_locator.dart';

import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../data/models/address_model.dart';
import '../../domain/use_case/add_address_use_case.dart';
import '../../domain/use_case/update_address_use_case.dart';
import '../controllers/address_bloc/address_bloc.dart';


class DetailsLocation extends StatefulWidget {
  static const name = "DetailsLocation";
  static const path = "DetailsLocation";
  final AddLocationDetailsParam param;
  const DetailsLocation({Key? key,required this.param }) : super(key: key);


  @override
  State<DetailsLocation> createState() => _DetailsLocationState();
}

class _DetailsLocationState extends State<DetailsLocation> {

   AddressBloc bloc= getIt<AddressBloc>();
  // GlobalObjectKey<ScaffoldState>? _scaffoldKey=const GlobalObjectKey<ScaffoldState>('-1');


  @override
  void initState() {


    super.initState();
  }
  final GlobalKey<FormBuilderState> _formKey =
  GlobalKey<FormBuilderState>();

   @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => bloc,
  child: Scaffold(
    // key: _scaffoldKey,
    backgroundColor: Colors.white,
      appBar: AppAppBar(
        label:S.current.AddNewAddress,
        leading: InkWell(
            onTap:()=>context.pop(context),
            child: Icon(Icons.arrow_back_ios,color: context.colorScheme.onSurface.withOpacity(.8),)),
      ),
      body: Padding(
        padding: REdgeInsetsDirectional.only(start: 17.w, end: 17.w),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              30.verticalSpace,
              Row(
                children: [
                  AppImage.asset(Assets.icons.icon.path,
                      color: Colors.black),
                  7.horizontalSpace,
                  AppText.buttonText(
                  S.current.DetailsLocation,
                    color: Colors.black,
                  )
                ],
              ),
              22.verticalSpace,
              AppTextFormField(
                hintText: S.current.Title,
                initialValue: widget.param.locationModel?.addressTitle,
                prefixIcon: AppImage.asset(Assets.icons.marker.path),
                validator: FormBuilderValidators.required(
                  errorText: S.of(context).This_field_is_required,
                ),
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.black, fontSize: 16.sp),
                name: 'address',
              ),
              14.verticalSpace,
              AppTextFormField(
                initialValue: widget.param.locationModel?.building,
                hintText: S.current.Floor,
                prefixIcon: AppImage.asset(Assets.icons.marker.path),
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.black, fontSize: 16.sp),
                validator: FormBuilderValidators.required(
                  errorText: S.of(context).This_field_is_required,
                ),                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                name: 'build',
              ),
              14.verticalSpace,
              AppTextFormField(
                hintText:S.current.AdditionalDetails,
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.black, fontSize: 16.sp),
                validator: FormBuilderValidators.required(
                  errorText: S.of(context).This_field_is_required,
                ),
                initialValue: widget.param.locationModel?.detail,
                prefixIcon: AppImage.asset(Assets.icons.marker.path),
                name: 'details',
              ),
              225.verticalSpace,
            BlocSelector<AddressBloc, AddressState,PageState>(
              selector:(state)=>widget.param.locationModel!=null?state.updateAddress:state.addAddress ,
      builder: (context, state) {
       return AppButton.dark(title: S.current.Confirm,
              isLoading: state.isLoading ,
              onPressed: () {

                if (_formKey.currentState?.saveAndValidate()??false) {
                  widget.param.locationModel!=null?
                  bloc.add(UpdateAddressEvent(
                    param: UpdateAddressParam(
                id: widget.param.locationModel!.id,
                      lat: widget.param.latLng.latitude,
                      lon: widget.param.latLng.longitude,
                      title: _formKey.currentState!.fields['address']!.value,
                      building:
                      _formKey.currentState!.fields['build']!.value,
                      detail:
                     _formKey.currentState!.fields['details']!.value,
                    ),
                    onSuccess: () {

                      context.goNamed(MyAddress.name);
                    },
                  ))
                      :
                  bloc.add(AddAddressEvent(
                    param: AddAddressParam(

                      lat: widget.param.latLng.latitude,
                      lon: widget.param.latLng.longitude,
                      title: _formKey.currentState!.fields['address']!.value,
                      building:
                     _formKey.currentState!.fields['build']!.value,
                      detail:
                      _formKey.currentState!.fields['details']!.value,
                    ),
                    onSuccess: (id) {
                      context.read<CartBloc>().add(ApplyCouponEvent(
                        addressId: id
                      ));
                    context.goNamed( widget.param.profileOrCart?MyAddress.name:CartPage.name);
                    },
                  ));
                }
              },);
  },
)
            ],
          ),
        ),
      ),
    ),
);
  }
}

class AddLocationDetailsParam {
  LatLng latLng;
  bool profileOrCart;
  AddressModel? locationModel;



  AddLocationDetailsParam({
    required this.locationModel,
    required this.latLng,
    required this.profileOrCart,
  });
}