import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/features/home/data/models/product_item_model.dart';
import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';
import '../../../app/data/models/pagination_model.dart';
import '../../data/models/product_by_category_model.dart';
import '../repositry/category_repo.dart';

@injectable
class ProductCategoryUseCase implements UseCase<PaginationModel<Product>, ProductCategoryParams> {
  final CategoryRepository repository;

  ProductCategoryUseCase({required this.repository});

  @override
  FutureResult<PaginationModel<Product>> call(params) async {
    return repository.getProductCategory(params);
  }
}

class ProductCategoryParams {
  final int pageKey;
  final int pageSize;
  final String id;

  ProductCategoryParams({
    required this.pageKey,
     this.pageSize=6,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'PageNumber': pageKey,
      'pageSize': pageSize,
      'id': id,
    };
  }


}
