import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/features/category/presentaion/bloc/category_bloc.dart';
import 'package:restaurant_customer/features/category/presentaion/pages/product_category.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/empty_widget.dart';
import '../../../app/presentation/widgets/error_widget.dart';
import '../../../app/presentation/widgets/loading_widget.dart';
import '../../../home/presentaion/widget/appbar_with_cart.dart';
import '../../../home/presentaion/widget/item_food.dart';
import 'details_product.dart';

class AllCategory extends StatefulWidget {
  static String path = "AllCategory";
  static String name = "AllCategory";

   const AllCategory({super.key,});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
   CategoryBloc categoryBloc=GetIt.I<CategoryBloc>();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryBloc..add(GetAllCategoryEvent()),
      child: AppScaffold(
        appBar: AppBarWithCart(
            title: S.current.all_food,
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: ()async {
                categoryBloc.add(GetAllCategoryEvent());
              },
              child: PageStateBuilder(
                  success: (data) =>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 6,
                              childAspectRatio: 1 / 1.01
                          ),
                          itemBuilder: (context, index) =>
                              ItemFood(item: data.data![index],onTap: (){
                                context.pushNamed(ProductCategory.name,extra:data.data![index].id??"");
                              },),
                          itemCount: data.data?.length ?? 0,
                        ),
                      ),
                 onError: () {
                   categoryBloc.add(GetAllCategoryEvent());
                 },
                  result: state.getAllCategoryData,
              )
            );
          },
        ),
      ),
    );
  }
}
