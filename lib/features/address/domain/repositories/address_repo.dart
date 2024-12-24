import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/app/data/models/initial_model.dart';
import 'package:restaurant_customer/features/app/domain/use_case/initial_request_use_case.dart';

import '../../data/models/address_model.dart';
import '../use_case/add_address_use_case.dart';
import '../use_case/update_address_use_case.dart';

abstract class AddressRepo {
  FutureResult<List<AddressModel>> getAllAddress();
  FutureResult<bool> deleteAddress(String id);
  FutureResult<String> addAddress(AddAddressParam param);
  FutureResult updateAddress(UpdateAddressParam param);

}
