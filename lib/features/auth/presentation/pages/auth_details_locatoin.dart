import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_customer/features/auth/domain/use_case/add_user_location_use_case.dart';
import 'package:restaurant_customer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:restaurant_customer/features/home/presentaion/pages/home.dart';
import 'package:restaurant_customer/services/service_locator.dart';

import '../../../../core/config/theme/extension.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_field.dart';

class AuthDetailsLocatoin extends StatefulWidget {
  const AuthDetailsLocatoin({super.key, required this.locatoin});
  static const name = "/AuthDetailsLocatoin";
  static const path = "/AuthDetailsLocatoin";
  final LatLng locatoin;

  @override
  State<AuthDetailsLocatoin> createState() => _AuthDetailsLocatoinState();
}

class _AuthDetailsLocatoinState extends State<AuthDetailsLocatoin> {
  final AuthBloc bloc = getIt<AuthBloc>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        label: S.current.DetailsLocation,
        leading: InkWell(
            onTap: () => context.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: context.colorScheme.onSurface.withOpacity(.8),
            )),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: Padding(
          padding: REdgeInsetsDirectional.only(start: 17.w, end: 17.w),
          child: FormBuilder(
            key: _formKey,
            child: ListView(
              children: [
                30.verticalSpace,
                Row(
                  children: [
                    AppImage.asset(
                      Assets.icons.icon.path,
                      color: context.colorScheme.shadow,
                    ),
                    7.horizontalSpace,
                    AppText.buttonText(
                      S.current.DetailsLocation,
                      color: Colors.black,
                    )
                  ],
                ),
                22.verticalSpace,
                AppTextFormField(
                  hintStyle: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.shadow.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  hintText: S.current.Title,
                  prefixIcon: AppImage.asset(Assets.icons.marker.path),
                  validator: FormBuilderValidators.required(
                    errorText: S.of(context).This_field_is_required,
                  ),
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: Colors.black, fontSize: 16.sp),
                  name: 'title',
                ),
                14.verticalSpace,
                AppTextFormField(
                  hintText: S.current.Floor,
                  hintStyle: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.shadow.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  prefixIcon: AppImage.asset(Assets.icons.marker.path),
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: Colors.black, fontSize: 16.sp),
                  validator: FormBuilderValidators.required(
                    errorText: S.of(context).This_field_is_required,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  name: 'build',
                ),
                14.verticalSpace,
                AppTextFormField(
                  hintStyle: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.shadow.withOpacity(0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  hintText: S.current.AdditionalDetails,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: Colors.black, fontSize: 16.sp),
                  validator: FormBuilderValidators.required(
                    errorText: S.of(context).This_field_is_required,
                  ),
                  prefixIcon: AppImage.asset(Assets.icons.marker.path),
                  name: 'details',
                ),
                225.verticalSpace,
                AppButton.dark(
                  title: S.current.Confirm,
                  onPressed: () {
                    _formKey.currentState!.save();
                    _formKey.currentState!.validate();
                    if (_formKey.currentState!.isValid) {
                      bloc.add(AddUserLocationEvent(
                        param: AddUserLocationParam(
                          skip: false,
                          lat: widget.locatoin.latitude,
                          lon: widget.locatoin.longitude,
                          title: _formKey.currentState!.fields['title']!.value,
                          building:
                              _formKey.currentState!.fields['build']!.value,
                          detail:
                              _formKey.currentState!.fields['details']!.value,
                        ),
                        onSuccess: () {
                          context.go(Home.path);
                        },
                      ));
                    }
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
