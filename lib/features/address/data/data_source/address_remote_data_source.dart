import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_customer/core/config/api_routes.dart';
import 'package:restaurant_customer/core/network/api_utils.dart';

import '../../domain/use_case/add_address_use_case.dart';
import '../../domain/use_case/update_address_use_case.dart';
import '../models/address_model.dart';

@injectable
class AddressRemoteDataSource {
  final Dio dio;

  AddressRemoteDataSource({required this.dio});


  Future<List<AddressModel>> getAllAddress() async {
    return throwAppException(() async {
      final result = await dio.get(ApiRoutes.profile.getAllLocation,data: {
        'pageSize':0
      });
      var data = result.data["data"] as List;
      List<AddressModel> allAddress =
      data.map((e) => AddressModel.fromJson(e)).toList();
      return allAddress;
    });
  }

  Future<bool> deleteAddress(String id) async {
    return throwAppException(() async {
      final result = await dio.delete(ApiRoutes.profile.deleteLocation,data: {'id':id});
      return true ;
    });
  }

  Future<String> addAddress(AddAddressParam param) async {
    return  throwAppException(() async {
      final result =  await dio.post(ApiRoutes.profile.addAddress, data: param.toMap());
      return result.data['id'];
    });
  }

  Future updateAddress(UpdateAddressParam param) async {
    return await throwAppException(() async {
      await dio.put(ApiRoutes.profile.updateLocation, data: param.toMap());
    });
  }
}
