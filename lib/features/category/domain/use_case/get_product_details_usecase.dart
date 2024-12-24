
import 'package:injectable/injectable.dart';
import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';
import '../../data/models/details_product_model.dart';
import '../repositry/category_repo.dart';

@injectable
class GetProductDetailsUseCase extends UseCase<DetailsProductModel, GetProductDetailsParams> {
  final CategoryRepository repository;

  GetProductDetailsUseCase({required this.repository});

  @override
  FutureResult<DetailsProductModel> call(params) async {
    return repository.getProductDetails(params);
  }
}

class GetProductDetailsParams {
  final String id;

  GetProductDetailsParams({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }


}
