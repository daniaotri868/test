import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';

import '../../../../services/service_locator.dart';
import '../../../app/presentation/widgets/empty_widget.dart';
import '../../../app/presentation/widgets/error_widget.dart';
import '../../../app/presentation/widgets/loading_widget.dart';
import '../bloc/profile_bloc.dart';
import 'discount_card.dart';

class CodeDiscountTap extends StatefulWidget {
  const CodeDiscountTap({super.key, required this.codeType});
  final bool codeType;

  @override
  State<CodeDiscountTap> createState() => _CodeDiscountTapState();
}

class _CodeDiscountTapState extends State<CodeDiscountTap> {
  late ProfileBloc bloc;

  @override
  void initState() {
    bloc = getIt<ProfileBloc>();
    bloc.add(GetAllCouponEvent(status: widget.codeType));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {

          return PageStateBuilder(
              init: Container(),
              success: (data) =>ListView.builder(
                itemCount: data.length,
                itemBuilder:(context, index) =>CardDiscount(discountModel: data[index],) ,
              ),
              loading: const LoadingWidget(),
              error: (Exception? error) {

                return ErrorWidgetPage(
                  onPressed: () {
                    bloc.add(GetAllCouponEvent(status: widget.codeType));                  },
                );
              } ,
              result:state.getAllCouponState ,
              empty: const EmptyWidget());
        },
      ),
    );
  }
}
