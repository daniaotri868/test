import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/common/constant/configuration/app_const.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';
import 'package:restaurant_customer/features/home/data/models/product_item_model.dart';
import '../../../../common/models/page_state/page_state.dart';

import '../../../../core/helper/helper_function.dart';
import '../../../cart/data/model/cart_model.dart';
import '../../../cart/data/model/extra_item.dart';
import '../../data/models/all_category_model.dart';
import '../../data/models/details_product_model.dart';
import '../../domain/use_case/get_all_category_usecase.dart';
import '../../domain/use_case/get_product_details_usecase.dart';
import '../../domain/use_case/product_category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAllCategoryUseCase getAllCategoryUseCase;
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final ProductCategoryUseCase productCategoryUseCase;

  CategoryBloc(
    this.getAllCategoryUseCase,
    this.getProductDetailsUseCase,
    this.productCategoryUseCase,
  ) : super(CategoryState()) {
    on<GetProductDetailsEvent>(_onGetProductDetailsEvent);
    on<GetAllCategoryEvent>(_onGetAllCategoryEvent);
    on<GetProductByCategoryEvent>(_onGetProductByCategoryEvent);
    on<SaveIdCategoryEvent>(_onSaveIdCategoryEvent);
    on<ChangeSelectedExtraItemEvent>(_onChangeSelectedExtraItemEvent);

  }

Future<void> _onSaveIdCategoryEvent(
    SaveIdCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(idCategory: event.id));
  }


  Future<void> _onChangeSelectedExtraItemEvent(
      ChangeSelectedExtraItemEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(getProductDetailsData: PageState.loaded(data: state.getProductDetailsData.data.copyWith(
      extraItem: event.list))));
  }

  Future<void> _onGetProductDetailsEvent(
      GetProductDetailsEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(getProductDetailsData: const PageState.loading()));
    final result = await getProductDetailsUseCase(GetProductDetailsParams(id: event.id??""));

        emit(state.copyWith(getProductDetailsData:  HelperFunctions.mapEitherToPageState(either: result,)));

  }

  Future<void> _onGetAllCategoryEvent(
      GetAllCategoryEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(getAllCategoryData: const PageState.loading()));
    final result = await getAllCategoryUseCase(NoParams());
        emit(state.copyWith(getAllCategoryData:  HelperFunctions.mapEitherToPageState(
          either: result,
          emptyChecker: (data)=>(data.data??[]).isEmpty

        )));
  }

  Future<void> _onGetProductByCategoryEvent(
      GetProductByCategoryEvent event, Emitter<CategoryState> emit) async {

    final result = await productCategoryUseCase(ProductCategoryParams(
      pageKey: event.pageKey,
      id: state.idCategory??""
    ));

    state.copyWith(getProductByCategoryData:HelperFunctions.pageNationEitherStatus(either: result,pageKey: event.pageKey,pagingController: state.getProductByCategoryData) );
    // result.fold((message) => state.getProductByCategoryData.error = message,
    //         (value) {
    //       final isLastPage = (value.pageNumber!) + 1 >= (value.totalPages!.toInt());
    //
    //       if (isLastPage) {
    //         state.getProductByCategoryData.appendLastPage(value.data??[]);
    //         return;
    //       }
    //
    //       final nextPageKey = event.pageKey !+ 1;
    //       state.getProductByCategoryData.appendPage(value.data??[], nextPageKey);
    //     });
  }



}
