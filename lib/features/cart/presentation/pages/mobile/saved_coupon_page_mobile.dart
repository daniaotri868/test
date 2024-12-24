import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/core/utils/extensions/box_shadow.dart';
import 'package:restaurant_customer/core/utils/extensions/form_builder.dart';
import 'package:restaurant_customer/features/cart/data/model/coupon_model.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import 'package:restaurant_customer/features/home/presentaion/pages/home.dart';

import '../../../../../common/models/page_state/result_builder.dart';
import '../../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';
import '../../../../app/presentation/widgets/app_appbar.dart';
import '../../../../app/presentation/widgets/app_button.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/empty_widget.dart';
import '../../../../app/presentation/widgets/error_widget.dart';
import '../../../../app/presentation/widgets/loading_widget.dart';
import '../../bloc/cart_bloc.dart';
import '../../widgets/saved_item.dart';

class SavedCouponPageMobile extends StatefulWidget {
  const SavedCouponPageMobile({super.key});

  @override
  State<SavedCouponPageMobile> createState() => _SavedCouponPageMobileState();
}

class _SavedCouponPageMobileState extends State<SavedCouponPageMobile> {
  final GlobalKey<FormBuilderState> _radioKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    context.read<CartBloc>().add(GetAllCouponsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return PageStateBuilder(
          success: (data) => RefreshIndicator(
            onRefresh: () async =>
                context.read<CartBloc>().add(GetAllCouponsEvent()),
            child: AppScaffold(
              appBar: AppAppBar(
                  label: S.of(context).Choose_a_saved_coupon,
                  showDefaultBackButton: true),
              bottomNavigationBar: AppButton(
                margin: REdgeInsets.only(left: 20, right: 20, bottom: 12),
                buttonType: AppButtonType.dark,
                buttonSize: ButtonSize.large,
                title: "تطبيق",
                isLoading: state.applyCoupon.isLoading(),
                onPressed: () {
                  if (_radioKey.validate()) {
                    CouponModel couponModel =
                        _radioKey.fieldValue("my_radio_group");
                    context.read<CartBloc>().add(ApplyCouponEvent(
                        onSuccess: () => context.pop(),
                        storeId:
                            context.read<HomeBloc>().state.storeSelected?.id ??
                                '',
                        code: couponModel.code));
                  }
                },
              ),
              body: ListView(children: [
                FormBuilder(
                  key: _radioKey,
                  child: RPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: FormBuilderRadioGroup<CouponModel>(
                      validator: (val) {
                        if (val == null) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      wrapRunSpacing: 7,
                      name: 'my_radio_group',
                      initialValue: data.data.firstWhereOrNull(
                            (element) => element.code == state.code,
                          ) ??
                          data.data[0],
                      controlAffinity: ControlAffinity.trailing,
                      itemDecoration: BoxDecoration(
                          color: context.colorScheme.offWhiteColor,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [context.getBoxShadow1]),
                      options: data.data
                          .map((saved) => FormBuilderFieldOption(
                                value: saved,
                                child: SavedItem(
                                  image: Assets.icons.savedLocation,
                                  title: saved.code ?? "",
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          result: state.getAllCouponsState,
          loading: const AppScaffold(body: LoadingWidget()),
          init: const SizedBox.shrink(),
          error: (Exception? error) {
            return AppScaffold(
              body: ErrorWidgetPage(
                onPressed: () {
                  context.read<CartBloc>().add(GetAllAddressEvent());
                },
              ),
            );
          },
          empty: RefreshIndicator(
            onRefresh: () async =>
                context.read<CartBloc>().add(GetAllAddressEvent()),
            child: const AppScaffold(body: EmptyWidget()),
          ),
        );
      },
    );
  }
}
