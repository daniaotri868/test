import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/config/theme/extension.dart';
import '../../../../core/config/theme/extension_color_scheme.dart';
import '../../../../core/helper/helper_function.dart';
import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../services/service_locator.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../domain/use_case/register_request_use_case.dart';
import '../bloc/auth_bloc.dart';
import 'allow_location_page.dart';

class AddPersonalInfoPage extends StatefulWidget {
  const AddPersonalInfoPage({super.key, required this.emailUser});
  static String get name => "/AddDetailsPage";
  static String get path => "/AddDetailsPage";
  final String emailUser;

  @override
  State<AddPersonalInfoPage> createState() => _AddPersonalInfoPageState();
}

class _AddPersonalInfoPageState extends State<AddPersonalInfoPage> {
  final AuthBloc bloc = getIt<AuthBloc>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  String dialCode = '';
  String phoneNumber = '';
  late String fcmToken;
  late bool stateNumber;

  String? selectedGender;
  late int gender;
  List<DropdownMenuItem<String>> _buildDropdownItems(BuildContext context) {
    return <String>[
      S.of(context).Male,
      S.of(context).Female,
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Row(
          children: [
            Icon(
              value == S.of(context).Male ? Icons.male : Icons.female,
              color: value == S.of(context).Male ? Colors.blue : Colors.pink,
            ),
            10.horizontalSpace,
            Text(
              value,
              style: context.textTheme.titleSmall,
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    getFcmTokn();
    super.initState();
  }

  Future<String?> getFcmTokn() async {
    if (Platform.isIOS) {
      return fcmToken = await FirebaseMessaging.instance.getAPNSToken() ?? "";
    } else {
      return fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: AppScaffold(
        body: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: REdgeInsets.only(left: 40, right: 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  50.verticalSpace,
                  Column(
                    children: [
                      AppImage.asset(
                        Assets.images.appLogo.path,
                        height: 111.h,
                        width: 111.w,
                      ),
                      10.verticalSpace,
                      AppText(
                        S.of(context).sing_in,
                        style: context.textTheme.titleLarge!.copyWith(
                          color: const Color(0xFF404040),
                        ),
                      ),
                      15.verticalSpace,
                      SizedBox(
                        width: 220.w,
                        child: AppText(
                          textAlign: TextAlign.center,
                          S.of(context).Sign_in_with_Google,
                          style: context.textTheme.labelMedium!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  Column(
                    children: [
                      AppTextFormField(
                        hintText: S.of(context).FirstName,
                        validator: FormBuilderValidators.required(
                          errorText: S.of(context).This_field_is_required,
                        ),
                        style: context.textTheme.titleSmall?.copyWith(
                            color: context.colorScheme.shadow, fontSize: 16.sp),
                        name: 'firstName',
                        hintStyle: context.textTheme.bodySmall!
                            .copyWith(color: context.colorScheme.hintColor),
                      ),
                      10.verticalSpace,
                      AppTextFormField(
                        hintText: S.of(context).LastName,
                        validator: FormBuilderValidators.required(
                          errorText: S.of(context).This_field_is_required,
                        ),
                        style: context.textTheme.titleSmall?.copyWith(
                            color: context.colorScheme.shadow, fontSize: 16.sp),
                        name: 'lastName',
                        hintStyle: context.textTheme.bodySmall!
                            .copyWith(color: context.colorScheme.hintColor),
                      ),
                      10.verticalSpace,
                      Container(
                        padding: REdgeInsets.only(left: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        child: InternationalPhoneNumberInput(
                          errorMessage: S.of(context).This_field_is_required,
                          inputDecoration: InputDecoration(
                            // hintText: S.of(context).Phone,
                            hintStyle: context.textTheme.bodySmall!
                                .copyWith(color: context.colorScheme.hintColor),
                            contentPadding: REdgeInsets.all(15),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');

                            dialCode = number.dialCode ?? '';
                            phoneNumber = number.parseNumber();
                          },
                          onInputValidated: (bool value) {
                            print(value);
                            stateNumber = value;
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                            leadingPadding: 4,
                          ),
                          selectorTextStyle: TextStyle(
                              color: context.colorScheme.shadow, fontSize: 13),
                          formatInput: true,
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          inputBorder: InputBorder.none,
                        ),
                      ),
                      8.verticalSpace,
                      Container(
                        height: 54.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        child: Center(
                          child: DropdownButtonFormField<String>(
                            alignment: Alignment.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  REdgeInsets.only(left: 10, right: 10),
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: context.colorScheme.primary,
                            ),
                            hint: AppText(
                              S.of(context).Gender,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.hintColor,
                              ),
                            ),
                            value: selectedGender,
                            validator: (value) {
                              if (value == null) {
                                return S.of(context).This_field_is_required;
                              }
                              return null;
                            },
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue;
                                if (selectedGender == S.of(context).Male) {
                                  gender = 0;
                                } else {
                                  gender = 1;
                                }
                              });
                            },
                            items: _buildDropdownItems(context),
                          ),
                        ),
                      )
                    ],
                  ),
                  150.verticalSpace,
                  SizedBox(
                    width: 1.sw,
                    child: AppButton.dark(
                      title: S.of(context).Continue,
                      onPressed: () async {
                        _formKey.currentState!.save();
                        _formKey.currentState!.validate();
                        if (_formKey.currentState!.isValid && stateNumber) {
                          bloc.add(RegisterRequestEvent(
                            param: RegisterParam(
                              email: widget.emailUser,
                              firstName: _formKey
                                  .currentState!.fields['firstName']!.value,
                              lastName: _formKey
                                  .currentState!.fields['lastName']!.value,
                              dialCode: dialCode,
                              phoneNumber: phoneNumber,
                              gender: gender,
                              fcmToken: fcmToken,
                              deviceId: await HelperFunctions.getDeviceId()??"",
                            ),
                            onSuccess: () {
                              context.push(AllowLocationPage.path);
                            },
                          ));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
