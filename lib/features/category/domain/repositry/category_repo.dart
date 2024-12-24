import 'package:restaurant_customer/core/utils/use_case.dart';

import '../../../../core/utils/types.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../../home/data/models/product_item_model.dart';
import '../../data/models/all_category_model.dart';
import '../../data/models/details_product_model.dart';
import '../../data/models/product_by_category_model.dart';
import '../use_case/get_product_details_usecase.dart';
import '../use_case/product_category_usecase.dart';

abstract class CategoryRepository {
  FutureResult<DetailsProductModel> getProductDetails(GetProductDetailsParams params);
  FutureResult<AllCategoryModel> getAllCategory(NoParams params);
  FutureResult<PaginationModel<Product>> getProductCategory(ProductCategoryParams params);

}
