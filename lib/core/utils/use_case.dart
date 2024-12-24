import 'package:restaurant_customer/core/utils/types.dart';

abstract class UseCase<T, Params> {
  FutureResult<T> call(Params params);
}

abstract class UseCaseNoParam<T> {
  FutureResult<T> call();
}

class NoParams {}
