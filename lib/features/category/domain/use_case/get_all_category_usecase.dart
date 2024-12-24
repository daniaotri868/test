import 'package:injectable/injectable.dart';
import '../../../../core/utils/types.dart';
import '../../../../core/utils/use_case.dart';
import '../../data/models/all_category_model.dart';
import '../repositry/category_repo.dart';

@injectable
class GetAllCategoryUseCase implements UseCase<AllCategoryModel, NoParams> {
  final CategoryRepository repository;

  GetAllCategoryUseCase({required this.repository});

  @override
  FutureResult<AllCategoryModel> call(params)  {
    return repository.getAllCategory(params);
  }
}


