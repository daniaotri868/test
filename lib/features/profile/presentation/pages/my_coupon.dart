import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';

import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../widgets/code_discount_tap.dart';

class MyCoupon extends StatelessWidget {
   MyCoupon({super.key});
  static String get name => "MyCoupon";

  static String get path => "MyCoupon";
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        label: S.current.MyCoupons,
        leading: InkWell(
            onTap:()=>context.pop(context),
            child: Icon(Icons.arrow_back_ios,color: context.colorScheme.onSurface.withOpacity(.8),)),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: context.colorScheme.outline,
              labelColor: context.colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: REdgeInsets.symmetric(horizontal: 0),
              labelStyle: context.textTheme.titleSmall,
              tabs: [
                Tab(
                    child: AppText.bodyMedium(
                     S.current.ActivateCoupons,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
                Tab(
                    child: AppText.bodyMedium(
                      S.current.PreviousCoupons,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ],
            ),
            10.verticalSpace,
            const Expanded(
              child: TabBarView(
                children: [
                  CodeDiscountTap(
                    codeType: true,
                  ),
                  CodeDiscountTap(
                    codeType: false,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
