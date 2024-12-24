import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/cart/presentation/pages/mobile/cart_page_mobile.dart';
import 'package:restaurant_customer/features/category/presentaion/bloc/category_bloc.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/error_widget.dart';
import '../../../app/presentation/widgets/loading_widget.dart';
import '../../../home/presentaion/widget/appbar_with_cart.dart';
import '../widget/image_product_details.dart';
import '../widget/info_product_details.dart';
import '../widget/nav_product_item.dart';

class DetailsProduct extends StatefulWidget {
  final String id;
  static String path = "DetailsProduct";
  static String name = "DetailsProduct";

   const DetailsProduct({super.key, required this.id});

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
   CategoryBloc categoryBloc=GetIt.I<CategoryBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => categoryBloc..add(GetProductDetailsEvent(id: widget.id)),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              categoryBloc.add(GetProductDetailsEvent(id: widget.id));
            },
            child: PageStateBuilder(
                init: Container(),
                success: (data) =>
                    AppScaffold(
                      appBar: AppBarWithCart(
                          title: S.current.details_product,
                      ),
                      body: Container(
                        margin: REdgeInsetsDirectional.only(top: 20),
                        decoration: BoxDecoration(
                            color: context.colorScheme.background,
                            borderRadius: BorderRadius.circular(23.r)
                        ),
                        padding: const EdgeInsetsDirectional.all(17),
                        child: ListView(
                          children: [
                            ImageProductDetails(image: data.image ?? "",),
                            InfoProductDetails(data: data,categoryBloc: categoryBloc,)
                          ],
                        ),
                      ),
                      bottomNavigationBar: NavProductItem(data: data,),
                    ),
                loading: const AppScaffold(body: LoadingWidget(),),
                error: (error) =>  AppScaffold(body: ErrorWidgetPage(onPressed: () {
                  categoryBloc.add(GetProductDetailsEvent(id: widget.id));

                },),),
                result: state.getProductDetailsData,
                empty: AppScaffold(body: ErrorWidgetPage(onPressed: () {
                  categoryBloc.add(GetProductDetailsEvent(id: widget.id,));
                },),)),
          );
        },
      ),
    );

  }
}
