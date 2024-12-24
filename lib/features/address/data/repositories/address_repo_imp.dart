import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/network/api_utils.dart';
import 'package:restaurant_customer/core/utils/types.dart';
import 'package:restaurant_customer/features/address/data/data_source/address_remote_data_source.dart';
import '../../domain/repositories/address_repo.dart';
import '../../domain/use_case/add_address_use_case.dart';
import '../../domain/use_case/update_address_use_case.dart';
import '../models/address_model.dart';

@Injectable(as: AddressRepo)
class AddressRepoImp extends AddressRepo {
  final AddressRemoteDataSource remoteDataSource;
  AddressRepoImp(this.remoteDataSource);



  @override
  FutureResult<List<AddressModel>> getAllAddress() =>toApiResult(()async=>remoteDataSource.getAllAddress());

  @override
  FutureResult<bool> deleteAddress(String id)  =>toApiResult(()async=>remoteDataSource.deleteAddress(id));

  @override
  FutureResult<String> addAddress(AddAddressParam param)  =>toApiResult(()async=>remoteDataSource.addAddress(param));

  @override
  FutureResult updateAddress(UpdateAddressParam param) =>toApiResult(()async=>remoteDataSource.updateAddress(param));

}
