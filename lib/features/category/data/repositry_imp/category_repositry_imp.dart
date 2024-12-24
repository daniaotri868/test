import 'package:injectable/injectable.dart';
import '../../../../core/network/api_utils.dart';
import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../../home/data/models/product_item_model.dart';
import '../../domain/repositry/category_repo.dart';
import '../../domain/use_case/get_product_details_usecase.dart';
import '../../domain/use_case/product_category_usecase.dart';
import '../data_source/category_remote_datasource.dart';
import '../models/all_category_model.dart';
import '../models/details_product_model.dart';
import '../models/product_by_category_model.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImp extends CategoryRepository {
  final CategoryRemoteDataSource dataSource;
  CategoryRepositoryImp({required this.dataSource});


  @override
  FutureResult<DetailsProductModel> getProductDetails(GetProductDetailsParams params)  => toApiResult(() async=> dataSource.getProductDetails(params));
  @override
  FutureResult<AllCategoryModel> getAllCategory(NoParams params)  => toApiResult(() async=> dataSource.getAllCategory(params));
  @override
  FutureResult<PaginationModel<Product>> getProductCategory(ProductCategoryParams params) async{
    return toApiResult(() => dataSource.getProductCategory(params));
  }


}
