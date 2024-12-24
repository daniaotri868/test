import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/features/category/presentaion/bloc/category_bloc.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/empty_widget.dart';
import '../../../app/presentation/widgets/error_widget.dart';
import '../../../app/presentation/widgets/loading_widget.dart';
import '../../../home/data/models/product_item_model.dart';
import '../../../home/presentaion/widget/appbar_with_cart.dart';
import '../../../home/presentaion/widget/item_category.dart';
import '../../../home/presentaion/widget/product_item.dart';
import 'details_product.dart';

class ProductCategory extends StatefulWidget {
  final String id;
  static String path = "ProductCategory";
  static String name = "ProductCategory";

  const ProductCategory({super.key, required this.id,});

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override

  ValueNotifier<String> categoryItemNotifier=ValueNotifier("");
   CategoryBloc categoryBloc=GetIt.I<CategoryBloc>();
  @override
  void initState() {
    super.initState();
    categoryBloc.add(GetAllCategoryEvent(),);
    categoryItemNotifier = ValueNotifier(widget.id);
    categoryBloc.add(SaveIdCategoryEvent(id: widget.id));
    categoryBloc.state.getProductByCategoryData.addPageRequestListener(
          (pageKey) {
            categoryBloc.add(GetProductByCategoryEvent(pageKey: pageKey));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => categoryBloc,
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return AppScaffold(
            appBar: AppBarWithCart(title: "",),
            body: RefreshIndicator(
                onRefresh: () async{
                  state.getProductByCategoryData.refresh();
                },
                child: Column(
                  children: [
                    PageStateBuilder(
                      init: Container(),
                      success: (data) => ValueListenableBuilder(
                        valueListenable: categoryItemNotifier,
                        builder: (context, value, child) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  SizedBox(
                            height: 52.h,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => ItemCategory(
                                  onTap: () {
                                    categoryItemNotifier.value = data.data?[index].id ?? "";
                                    categoryBloc.add(SaveIdCategoryEvent(id: data.data?[index].id ?? ""));
                                    state.getProductByCategoryData.itemList=null;
                                  },
                                  selected: categoryItemNotifier.value == data.data?[index].id,
                                  item: data.data![index],
                                ),
                                separatorBuilder: (context, index) => 11.horizontalSpace,
                                itemCount: data.data!.length??0),
                          ),
                        ),
                      ),
                      onError: () {
                        state.getProductByCategoryData.refresh();
                      },
                      result: state.getAllCategoryData,
                    ),
                    20.verticalSpace,
                    Expanded(
                        child: PagedGridView(
                          pagingController: state.getProductByCategoryData,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1 / 1.2),
                          builderDelegate: PagedChildBuilderDelegate<Product>(
                              noItemsFoundIndicatorBuilder: (context) =>
                                  Container(),
                              itemBuilder: (context, item, index) =>
                                  ProductItem(item: item,onTap: () {
                                    context.pushNamed(DetailsProduct.name,extra:item.id??"");

                                  },)),
                        )),
                  ],
                )
            ),
          );
        },
      ),
    );
  }
}
