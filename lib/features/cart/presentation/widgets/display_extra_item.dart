import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/core/config/theme/extension_color_scheme.dart';
import 'package:restaurant_customer/features/order/presentation/widgets/text_extra_item.dart';

import '../../../../common/models/page_state/bloc_status.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/animated_dialog.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../data/model/extra_item.dart';
import '../bloc/cart_bloc.dart';
import 'data_extra_item.dart';
class DisplayExtraItem extends StatelessWidget {
  const DisplayExtraItem({super.key, required this.extraItem, required this.itemId});
   final List<ExtraItemModel> extraItem;
   final String itemId;


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Flexible(
          child:
            TextExtraItem(text:     extraItem
                .map(
                  (e) => "${e.name}(${e.quantity})",
            )
                .join(' - ') ,)
        ),
        3.horizontalSpace,
        InkWell(
          onTap: () => AnimatedDialog.show(
            context,
            child: BlocSelector<CartBloc, CartState, BlocStatus>(
              selector: (state) => state.updateExtraItem,
              builder: (context, state) => DataExtraItem(
                extraItemList: extraItem,
                isAllSelected: true,
                isLoading: state.isLoading(),
                onPressed: (extraItems) {
                  context
                      .read<CartBloc>()
                      .add(UpdateExtraItemEvent(
                    onSuccess: () => context.pop(),
                    cartId: itemId,
                    extraItems: extraItems,
                  ));
                },
              ),
            ),
          ),
          child: AppText.footnote(
            S.current.More,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: context.colorScheme.secondary,
            ),
            fontWeight: FontWeight.w600,
            color: context.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
