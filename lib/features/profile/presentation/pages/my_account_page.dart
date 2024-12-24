import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/common/models/page_state/bloc_status.dart';
import 'package:restaurant_customer/core/config/theme/app_theme.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/profile/presentation/pages/profile.dart';

import '../../../../generated/l10n.dart';
import '../../../../services/service_locator.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../data/model/profile_model.dart';
import '../../domain/use_case/update_profile_use_case.dart';
import '../bloc/profile_bloc.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key,required this.param});
  static String get name => "MyAccountPage";

  static String get path => "MyAccountPage";
final   ProfileParam param;
  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final ValueNotifier<String?> selectedReason = ValueNotifier("male");
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  ProfileModel? profileModel;
   ProfileBloc bloc= getIt<ProfileBloc>();



  @override
  void initState() {
selectedReason.value= widget.param.data.gender;

 profileModel=ProfileModel(
     firstName: widget.param.data.firstName,
     lastName: widget.param.data.lastName,
      gender: widget.param.data.gender);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => bloc
      ,
  child: AppScaffold(
      appBar: AppAppBar(
     label: S.current.Profile,
        leading: InkWell(
            onTap:()=>context.pop(context),
            child: Icon(Icons.arrow_back_ios,color: context.colorScheme.onSurface.withOpacity(.8),)),
      ),
        body: Padding(
          padding: REdgeInsetsDirectional.only(start: 26,end: 26),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  50.verticalSpace,
                  AppTextFormField(
                    name: 'firstName',
                    onChanged: (value) => setState(() {
                      widget.param.data.firstName = value;
                    }),
                    validator: FormBuilderValidators.required(),
                    fillColor: context.colorScheme.textFieldColor,
                    title: S.current.FirstName,
                    initialValue: widget.param.data.firstName,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.edit_sharp,color: context.colorScheme.primary,size: 25.r,),
                    ),
                  ),
                  20.verticalSpace,

                  AppTextFormField(
                    name: 'lastName',
                    onChanged: (value) => setState(() {
                      widget.param.data.lastName = value;
                    }),
                   fillColor: context.colorScheme.textFieldColor,
                    title:S.current.LastName,
                    initialValue: widget.param.data.lastName ,
                    validator: FormBuilderValidators.required(),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.edit_sharp,color: context.colorScheme.primary,size: 25.r,),
                    ),
                  ),
                  AppText(
                    S.current.Gender,
                    color: Colors.black,
                    style: context.textTheme.label,
                  ),
                  7.verticalSpace,
                  Padding(
                    padding: REdgeInsetsDirectional.only(start: 25, end: 46),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 14.w,
                              child: Radio(
                                value: 'Female',
                                activeColor: context.colorScheme.primary,
                                groupValue: selectedReason.value,
                                onChanged: (value) {
                                  setState(() {
                                    selectedReason.value = value;
                                    widget.param.data.gender=value;
                                  });
                                },
                              ),
                            ),
                            5.horizontalSpace,
                            AppText.bodyMedium(S.current.Female,
                                color: Colors.black),

                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            SizedBox(
                              width: 14.w,
                              child: Radio(
                                value: 'Male',
                                activeColor: context.colorScheme.primary,
                                groupValue: selectedReason.value,
                                onChanged: (value) {
                                  setState(() {
                                    selectedReason.value = value;
                                    widget.param.data.gender=value;

                                  });
                                },
                              ),
                            ),
                            5.horizontalSpace,
                            AppText.bodyMedium(S.current.Male, color: Colors.black),

                          ],
                        ),
                      ],
                    ),
                  ),
                  50.verticalSpace,
                  BlocBuilder<ProfileBloc, ProfileState>(
    // selector: (state)=>state.updateProfile,
    builder: (context, state) {
      return FractionallySizedBox(
                    widthFactor: 1,
                      child:profileModel==widget.param.data?
                      AppButton.gray(
                        title: S.current.update,


                      ):
                      AppButton.dark(

                          title: S.current.update,
                          onPressed:
                              (){


                            if (_formKey.currentState?.saveAndValidate()??false) {
                              widget.param.bloc.add(
                                UpdateProfileEvent(
                                    param:  UpdateProfileeParam(
                                        firstName: _formKey
                                            .currentState!
                                            .fields['firstName']!
                                            .value,
                                        lastName: _formKey
                                            .currentState!
                                            .fields['lastName']!
                                            .value,
                                        gender:
                                        selectedReason.value!),

                                    onSuccess: () {
                                      widget.param.bloc.add(GetProfileEvent());
                                      context.goNamed(ProfilePage.name);
                                      }
                                ),
                              );
                            }
                          }

                      )
      );
    },
    )
                ],
              ),
            ),
          ),
        ),
      ),
);
  }
}

class ProfileParam{
  final ProfileModel data;
  final ProfileBloc bloc;
  ProfileParam({required this.data,required this.bloc});
}
