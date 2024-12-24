import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/address/presentation/pages/details_location.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/price_with_currency.dart';
import '../../data/model/extra_item.dart';
import '../cubit/extra_item_cubit.dart';
import 'extra_item_widget.dart';

class DataExtraItem extends StatefulWidget {
  final List<ExtraItemModel> extraItemList;
  final Function(List<ExtraItemModel>) onPressed;
  final bool isAllSelected;
  final bool isLoading;

  const DataExtraItem({
    super.key,
    required this.extraItemList,
    required this.onPressed,
    this.isAllSelected = false,
    this.isLoading = false,
  });

  @override
  State<DataExtraItem> createState() => _DataExtraItemState();
}

class _DataExtraItemState extends State<DataExtraItem> {
  final ExtraItemCubit _extraItemCubit = ExtraItemCubit();

  @override
  void initState() {
    _extraItemCubit.initExtraItems(widget.extraItemList, widget.isAllSelected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _extraItemCubit,
      child: BlocBuilder<ExtraItemCubit, ExtraItemState>(
        builder: (context, state) {
          return Padding(
            padding: REdgeInsets.symmetric(horizontal: 25, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView.separated(
                  itemBuilder: (context, index) => ExtraItemWidget(
                      item: state.extraItems[index],
                      minus:state.extraItems[index].quantity!=1? () => _extraItemCubit.updateQuantity(
                          isAdd: false,
                          extraItemId: state.extraItems[index].id):null,
                      add: () => _extraItemCubit.updateQuantity(
                          isAdd: true,
                          extraItemId: state.extraItems[index].id),
                      onChange: () => _extraItemCubit.changeCheckBox(
                          extraItemId: state.extraItems[index].id)),
                  itemCount: state.extraItems.length,
                  separatorBuilder: (context, index) => 10.verticalSpace,
                )),
                if (state.totalPrice != 0)
                  Padding(
                    padding: REdgeInsetsDirectional.only(bottom: 16, start: 22),
                    child: PriceWithCurrency(
                      isFlexible: false,
                      price: state.totalPrice,
                      style: textTheme.labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                      mainAxisAlignment: MainAxisAlignment.start,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                AppButton.dark(
                  isLoading: widget.isLoading,
                  fixedSize: Size(400.w, 50.h),
                  child: AppText(S.current.add_to_cart),
                  onPressed: () {
                    widget.onPressed(state.extraItems);
                    context.pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
