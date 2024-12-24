import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/utils/extensions/form_builder.dart';
import 'package:restaurant_customer/generated/flutter_gen/assets.gen.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/app_text_field.dart';
import '../../../home/presentaion/bloc/home_bloc.dart';
import '../bloc/cart_bloc.dart';

class AddCouponDialog extends StatelessWidget {
  AddCouponDialog({
    super.key,
  });

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height: 331,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 25, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                AppImage.asset(
                  Assets.icons.coupon,
                  size: 30,
                ),
                7.horizontalSpace,
                AppText.labelBold(
                  S.of(context).Add_a_new_coupon,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: AppImage.asset(
                    Assets.icons.close,
                    size: 25,
                  ),
                ),
              ],
            ),
            43.verticalSpace,
            FormBuilder(
              key: _formKey,
              child: AppTextFormField(
                title: S.of(context).Coupon_code,
                name: "code",
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.equalLength(6),
                  ],
                ),
                maxLines: 1,
                keyboardType: TextInputType.text,
                hintText: S.of(context).Coupon_code,
              ),
            ),
            const Spacer(),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return AppButton.dark(
                  isLoading: state.applyCoupon.isLoading(),
                  title: S.of(context).Application,
                  onPressed: () {
                    if (_formKey.validate()) {
                      context.read<CartBloc>().add((ApplyCouponEvent(
                            storeId: context
                                    .read<HomeBloc>()
                                    .state
                                    .storeSelected
                                    ?.id ??
                                '',
                            code: _formKey.fieldValue("code"),
                            onSuccess: () => context.pop(),
                          )));
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
