import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_customer/features/order/presentation/bloc/order_bloc.dart';

import '../../../../../../core/config/theme/app_theme.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../app/presentation/widgets/app_appbar.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../widgets/order_tab.dart';

class OrderPageMobile extends StatefulWidget {
  const OrderPageMobile({super.key});

  @override
  State<OrderPageMobile> createState() => _OrderPageMobileState();
}

class _OrderPageMobileState extends State<OrderPageMobile> {
  final OrderBloc _orderBloc = GetIt.I<OrderBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _orderBloc,
      child: AppScaffold(
        appBar: AppAppBar(
          showDefaultBackButton: true,
          label: S.of(context).My_order,
        ),
        body: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 2,
                  labelPadding: REdgeInsets.only(bottom: 10),
                  indicatorPadding: REdgeInsets.symmetric(horizontal: 28.0),
                  tabs: [
                    Tab(
                        child: AppText(
                      S.of(context).Active_order,
                    )),
                    Tab(child: AppText(S.of(context).Previous_order)),
                  ],
                  labelStyle: textTheme.label.bold,
                  unselectedLabelStyle: textTheme.label.medium),
              const Expanded(
                child: TabBarView(
                  children: [
                    OrderTab(
                      isActive: true,
                    ),
                    OrderTab(
                      isActive: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
