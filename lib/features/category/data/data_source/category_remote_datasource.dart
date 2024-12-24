import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/utils/use_case.dart';

import '../../../../core/config/api_routes.dart';
import '../../../../core/network/api_utils.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../../home/data/models/product_item_model.dart';
import '../../domain/use_case/get_product_details_usecase.dart';
import '../../domain/use_case/product_category_usecase.dart';
import '../models/all_category_model.dart';
import '../models/details_product_model.dart';
import '../models/product_by_category_model.dart';

@injectable
class CategoryRemoteDataSource {
  CategoryRemoteDataSource({required this.dio});
  final Dio dio;

  Future<DetailsProductModel> getProductDetails(GetProductDetailsParams params) async {
    return throwAppException(() async {
      final result = await dio.get(ApiRoutes.home.getProductDetails,queryParameters: params.toMap());
      return DetailsProductModel.fromJson(result.data);
    });
  }

  Future<PaginationModel<Product>> getProductCategory(ProductCategoryParams params) async {
    return throwAppException(() async {
      final result = await dio.get(ApiRoutes.home.productByCategory,queryParameters: params.toMap());
      return PaginationModel<Product>.fromJson(result.data,(json) => Product.fromJson(json),);
    });
  }

 Future<AllCategoryModel> getAllCategory(NoParams params) async {
   return throwAppException(() async {
     final result = await dio.get(ApiRoutes.home.getAllCategory,data: {});
     return AllCategoryModel.fromJson(result.data);
   });
  }

}
