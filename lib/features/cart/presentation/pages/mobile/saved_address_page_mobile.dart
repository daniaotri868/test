
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/core/utils/extensions/box_shadow.dart';
import 'package:restaurant_customer/core/utils/extensions/form_builder.dart';
import 'package:restaurant_customer/features/cart/data/model/address_model.dart';
import 'package:restaurant_customer/features/cart/presentation/widgets/saved_item.dart';
import 'package:restaurant_customer/generated/flutter_gen/assets.gen.dart';

import '../../../../../generated/l10n.dart';
import '../../../../app/presentation/widgets/app_appbar.dart';
import '../../../../app/presentation/widgets/app_button.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/empty_widget.dart';
import '../../../../app/presentation/widgets/error_widget.dart';
import '../../../../app/presentation/widgets/loading_widget.dart';
import '../../../../home/presentaion/bloc/home_bloc.dart';
import '../../bloc/cart_bloc.dart';

class SavedAddressPageMobile extends StatefulWidget {
  const SavedAddressPageMobile({super.key});

  @override
  State<SavedAddressPageMobile> createState() =>
      _SavedAddressPageMobileState();
}

class _SavedAddressPageMobileState extends State<SavedAddressPageMobile> {
  // late CartBloc context.read<CartBloc>();

  @override
  void initState() {
    // context.read<CartBloc>() = GetIt.I<CartBloc>();
    context.read<CartBloc>().add(GetAllAddressEvent());
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<FormBuilderState> _radioKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return PageStateBuilder(
          success: (data) => RefreshIndicator(
            onRefresh: () async => context.read<CartBloc>().add(GetAllAddressEvent()),
            child: AppScaffold(
              appBar: AppAppBar(
                  label: S.of(context).Choose_a_saved_address,
                  showDefaultBackButton: true),
              bottomNavigationBar: AppButton(
                margin: REdgeInsets.only(left: 20, right: 20, bottom: 12),
                buttonType: AppButtonType.dark,
                buttonSize: ButtonSize.large,

                title: S.of(context).Application,

                onPressed: () {
                  if (_radioKey.validate()) {
                    AddressModel addressModel =
                        _radioKey.fieldValue("my_radio_group");
                    context.read<CartBloc>().add(ApplyCouponEvent(
                      onSuccess: () => context.pop(),
                        storeId: context.read<HomeBloc>().state.storeSelected?.id??"",
                        addressId: addressModel.id));
                  }
                },
                isLoading: state.applyCoupon.isLoading(),
              ),
              body: ListView(children: [
                FormBuilder(
                  key: _radioKey,
                  child: RPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    child: FormBuilderRadioGroup<AddressModel>(
                      validator: (val) {
                        if (val == null) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      wrapRunSpacing: 10,
                      name: 'my_radio_group',
                      initialValue:data.firstWhereOrNull((element) => element.id==state.addressId,)??data[0],
                      controlAffinity: ControlAffinity.trailing,
                      itemDecoration: BoxDecoration(
                          color: context.colorScheme.offWhiteColor,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [context.getBoxShadow1]),
                      options: data
                          .map((saved) => FormBuilderFieldOption(
                                value: saved,
                                child: SavedItem(
                                  image: Assets.icons.savedLocation,
                                  title: saved.addressTitle!,
                                  subTitle: saved.detail,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          result: state.getAllAddressState,
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
            onRefresh: () async => context.read<CartBloc>().add(GetAllAddressEvent()),
            child: const AppScaffold(
                body: EmptyWidget()),
          ),
        );
      },
    );
  }
}
