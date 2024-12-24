part of 'category_bloc.dart';

@immutable
class CategoryState {
  final PageState<AllCategoryModel> getAllCategoryData;
  final PageState<DetailsProductModel> getProductDetailsData;
  final  PagingController<int, Product> getProductByCategoryData;
  final String ?idCategory;
  CategoryState({
    this.getAllCategoryData = const PageState.init(),
    this.getProductDetailsData = const PageState.init(),
    this.idCategory="0",
    PagingController<int, Product>? getProductByCategoryData,
  }):getProductByCategoryData =
      getProductByCategoryData ?? PagingController(firstPageKey: AppConst.pageKey) ;

  CategoryState copyWith(
      {
        final PagingController<int, Product>? getProductByCategoryData,
        final PageState<AllCategoryModel> ?getAllCategoryData,
        final PageState<DetailsProductModel> ?getProductDetailsData,
        final String ?idCategory
      }) {
    return CategoryState(
        getAllCategoryData: getAllCategoryData ?? this.getAllCategoryData,
        getProductByCategoryData: getProductByCategoryData ?? this.getProductByCategoryData,
        getProductDetailsData: getProductDetailsData ?? this.getProductDetailsData,
        idCategory: idCategory??this.idCategory
    );
  }


}
