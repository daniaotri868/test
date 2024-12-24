// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:restaurant_customer/core/utils/client.dart' as _i955;
import 'package:restaurant_customer/features/address/data/data_source/address_remote_data_source.dart'
    as _i663;
import 'package:restaurant_customer/features/address/data/repositories/address_repo_imp.dart'
    as _i85;
import 'package:restaurant_customer/features/address/domain/repositories/address_repo.dart'
    as _i667;
import 'package:restaurant_customer/features/address/domain/use_case/add_address_use_case.dart'
    as _i211;
import 'package:restaurant_customer/features/address/domain/use_case/delete_address_use_case.dart'
    as _i325;
import 'package:restaurant_customer/features/address/domain/use_case/get_all_address_use_case.dart'
    as _i722;
import 'package:restaurant_customer/features/address/domain/use_case/update_address_use_case.dart'
    as _i157;
import 'package:restaurant_customer/features/address/presentation/controllers/address_bloc/address_bloc.dart'
    as _i366;
import 'package:restaurant_customer/features/app/data/data_source/app_remote_data_source.dart'
    as _i951;
import 'package:restaurant_customer/features/app/data/repositories/app_repo_imp.dart'
    as _i959;
import 'package:restaurant_customer/features/app/data/repositories/prefs_repository_impl.dart'
    as _i427;
import 'package:restaurant_customer/features/app/domain/repositories/app_repo.dart'
    as _i972;
import 'package:restaurant_customer/features/app/domain/repositories/prefs_repository.dart'
    as _i4;
import 'package:restaurant_customer/features/app/domain/use_case/initial_request_use_case.dart'
    as _i921;
import 'package:restaurant_customer/features/app/presentation/controllers/app_bloc/app_bloc.dart'
    as _i197;
import 'package:restaurant_customer/features/auth/data/data_source/auth_remote_data_source.dart'
    as _i604;
import 'package:restaurant_customer/features/auth/data/repo_imp/auth_repo_imp.dart'
    as _i494;
import 'package:restaurant_customer/features/auth/domain/repo/auth_repo.dart'
    as _i1037;
import 'package:restaurant_customer/features/auth/domain/use_case/add_user_location_use_case.dart'
    as _i162;
import 'package:restaurant_customer/features/auth/domain/use_case/get_adress_details_use_case.dart'
    as _i1033;
import 'package:restaurant_customer/features/auth/domain/use_case/register_request_use_case.dart'
    as _i360;
import 'package:restaurant_customer/features/auth/presentation/bloc/auth_bloc.dart'
    as _i202;
import 'package:restaurant_customer/features/cart/data/data_sources/cart_remote_datasource.dart'
    as _i737;
import 'package:restaurant_customer/features/cart/data/repositories/cart_repository_imp.dart'
    as _i775;
import 'package:restaurant_customer/features/cart/domain/repositories/cart_repository.dart'
    as _i249;
import 'package:restaurant_customer/features/cart/domain/use_case/add_order_use_case.dart'
    as _i785;
import 'package:restaurant_customer/features/cart/domain/use_case/add_to_cart_usecase.dart'
    as _i417;
import 'package:restaurant_customer/features/cart/domain/use_case/apply_coupon_use_case.dart'
    as _i524;
import 'package:restaurant_customer/features/cart/domain/use_case/get_all_address_use_case.dart'
    as _i927;
import 'package:restaurant_customer/features/cart/domain/use_case/get_all_coupons_use_case.dart'
    as _i142;
import 'package:restaurant_customer/features/cart/domain/use_case/get_cart_use_case.dart'
    as _i495;
import 'package:restaurant_customer/features/cart/domain/use_case/remove_item_use_case.dart'
    as _i1011;
import 'package:restaurant_customer/features/cart/domain/use_case/update_cart_use_case.dart'
    as _i533;
import 'package:restaurant_customer/features/cart/domain/use_case/update_extra_item_use_case.dart'
    as _i371;
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart'
    as _i883;
import 'package:restaurant_customer/features/category/data/data_source/category_remote_datasource.dart'
    as _i33;
import 'package:restaurant_customer/features/category/data/repositry_imp/category_repositry_imp.dart'
    as _i301;
import 'package:restaurant_customer/features/category/domain/repositry/category_repo.dart'
    as _i668;
import 'package:restaurant_customer/features/category/domain/use_case/get_all_category_usecase.dart'
    as _i854;
import 'package:restaurant_customer/features/category/domain/use_case/get_product_details_usecase.dart'
    as _i24;
import 'package:restaurant_customer/features/category/domain/use_case/product_category_usecase.dart'
    as _i78;
import 'package:restaurant_customer/features/category/presentaion/bloc/category_bloc.dart'
    as _i213;
import 'package:restaurant_customer/features/home/data/data_source/home_remote_datasource.dart'
    as _i718;
import 'package:restaurant_customer/features/home/data/repositry_imp/home_repositry_imp.dart'
    as _i795;
import 'package:restaurant_customer/features/home/domain/repositry/home_repo.dart'
    as _i430;
import 'package:restaurant_customer/features/home/domain/use_case/home_usecase.dart'
    as _i962;
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart'
    as _i212;
import 'package:restaurant_customer/features/notification/data/datasoueces/notification_remote_data_source.dart'
    as _i410;
import 'package:restaurant_customer/features/notification/data/repositories/notification_repository_impl.dart'
    as _i206;
import 'package:restaurant_customer/features/notification/domain/repositories/notification_repository.dart'
    as _i253;
import 'package:restaurant_customer/features/notification/domain/usecases/change_status_notifications_usecase.dart'
    as _i451;
import 'package:restaurant_customer/features/notification/domain/usecases/get_all_notification_usecase.dart'
    as _i371;
import 'package:restaurant_customer/features/notification/presentation/bloc/notification_bloc.dart'
    as _i1052;
import 'package:restaurant_customer/features/order/data/data_sources/order_remote_datasource.dart'
    as _i41;
import 'package:restaurant_customer/features/order/data/repositories/order_repository_imp.dart'
    as _i966;
import 'package:restaurant_customer/features/order/domain/repositories/order_repository.dart'
    as _i696;
import 'package:restaurant_customer/features/order/domain/use_case/get_all_orders_use_case.dart'
    as _i146;
import 'package:restaurant_customer/features/order/domain/use_case/get_order_details_use_case.dart'
    as _i144;
import 'package:restaurant_customer/features/order/presentation/bloc/order_bloc.dart'
    as _i557;
import 'package:restaurant_customer/features/profile/data/data_sources/profile_remote_datasource.dart'
    as _i208;
import 'package:restaurant_customer/features/profile/data/repositories/profile_repository_imp.dart'
    as _i186;
import 'package:restaurant_customer/features/profile/domain/repositories/profile_repository.dart'
    as _i423;
import 'package:restaurant_customer/features/profile/domain/use_case/get_all_coupon_use_case.dart'
    as _i644;
import 'package:restaurant_customer/features/profile/domain/use_case/get_profile_use_case.dart'
    as _i960;
import 'package:restaurant_customer/features/profile/domain/use_case/logout_use_case.dart'
    as _i344;
import 'package:restaurant_customer/features/profile/domain/use_case/update_profile_use_case.dart'
    as _i709;
import 'package:restaurant_customer/features/profile/presentation/bloc/profile_bloc.dart'
    as _i382;
import 'package:restaurant_customer/services/location_service.dart' as _i39;
import 'package:restaurant_customer/services/service_locator.dart' as _i535;
import 'package:restaurant_customer/services/storage_service/storage_service.dart'
    as _i962;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i39.LocationService>(() => _i39.LocationService());
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i962.HiveService>(() => _i962.HiveService());
    gh.factory<_i4.StorageRepository>(() => _i427.StorageRepositoryImpl());
    gh.factory<_i663.AddressRemoteDataSource>(
        () => _i663.AddressRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i951.AppRemoteDataSource>(
        () => _i951.AppRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i604.AuthRemoteDataSource>(
        () => _i604.AuthRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i737.CartRemoteDataSource>(
        () => _i737.CartRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i33.CategoryRemoteDataSource>(
        () => _i33.CategoryRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i718.HomeRemoteDataSource>(
        () => _i718.HomeRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i410.NotificationRemoteDataSource>(
        () => _i410.NotificationRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i41.OrderRemoteDataSource>(
        () => _i41.OrderRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i718.HomeRemoteDataSource>(
        () => _i718.HomeRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i951.AppRemoteDataSource>(
        () => _i951.AppRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i33.CategoryRemoteDataSource>(
        () => _i33.CategoryRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i604.AuthRemoteDataSource>(
        () => _i604.AuthRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i208.ProfileRemoteDataSource>(
        () => _i208.ProfileRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i663.AddressRemoteDataSource>(
        () => _i663.AddressRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i737.CartRemoteDataSource>(
        () => _i737.CartRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.factory<_i423.ProfileRepository>(() => _i186.ProfileRepositoryImp(
        dataSource: gh<_i208.ProfileRemoteDataSource>()));
    gh.factory<_i249.CartRepository>(() =>
        _i775.CartRepositoryImp(dataSource: gh<_i737.CartRemoteDataSource>()));
    gh.factory<_i955.ClientApi>(() => _i955.ClientApi(gh<_i361.Dio>()));
    gh.factory<_i927.GetAllAddressUseCase>(
        () => _i927.GetAllAddressUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i417.AddToCartCartUseCase>(
        () => _i417.AddToCartCartUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i142.GetAllCouponsUseCase>(
        () => _i142.GetAllCouponsUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i371.UpdateExtraItemUseCase>(
        () => _i371.UpdateExtraItemUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i533.UpdateCartUseCase>(
        () => _i533.UpdateCartUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i785.AddOrderUseCase>(
        () => _i785.AddOrderUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i1011.RemoveItemUseCase>(
        () => _i1011.RemoveItemUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i495.GetCartUseCase>(
        () => _i495.GetCartUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i524.ApplyCouponUseCase>(
        () => _i524.ApplyCouponUseCase(gh<_i249.CartRepository>()));
    gh.factory<_i667.AddressRepo>(
        () => _i85.AddressRepoImp(gh<_i663.AddressRemoteDataSource>()));
    gh.factory<_i696.OrderRepository>(() =>
        _i966.OrderRepositoryImp(dataSource: gh<_i41.OrderRemoteDataSource>()));
    gh.factory<_i1037.AuthRepo>(
        () => _i494.AuthRepoImp(gh<_i604.AuthRemoteDataSource>()));
    gh.factory<_i883.CartBloc>(() => _i883.CartBloc(
          gh<_i785.AddOrderUseCase>(),
          gh<_i524.ApplyCouponUseCase>(),
          gh<_i1011.RemoveItemUseCase>(),
          gh<_i495.GetCartUseCase>(),
          gh<_i417.AddToCartCartUseCase>(),
          gh<_i927.GetAllAddressUseCase>(),
          gh<_i142.GetAllCouponsUseCase>(),
          gh<_i533.UpdateCartUseCase>(),
          gh<_i371.UpdateExtraItemUseCase>(),
        ));
    gh.factory<_i344.LogoutUseCase>(
        () => _i344.LogoutUseCase(gh<_i423.ProfileRepository>()));
    gh.factory<_i709.UpdateProfileUseCase>(
        () => _i709.UpdateProfileUseCase(gh<_i423.ProfileRepository>()));
    gh.factory<_i644.GetAllCouponUseCase>(
        () => _i644.GetAllCouponUseCase(gh<_i423.ProfileRepository>()));
    gh.factory<_i960.GetProfileUseCase>(
        () => _i960.GetProfileUseCase(gh<_i423.ProfileRepository>()));
    gh.factory<_i668.CategoryRepository>(() => _i301.CategoryRepositoryImp(
        dataSource: gh<_i33.CategoryRemoteDataSource>()));
    gh.factory<_i430.HomeRepository>(() =>
        _i795.HomeRepositoryImp(dataSource: gh<_i718.HomeRemoteDataSource>()));
    gh.factory<_i253.NotificationRepository>(() =>
        _i206.NotificationRepositoryImp(
            dataSource: gh<_i410.NotificationRemoteDataSource>()));
    gh.factory<_i972.AppRepo>(
        () => _i959.AppRepoImp(gh<_i951.AppRemoteDataSource>()));
    gh.factory<_i962.HomeUseCase>(
        () => _i962.HomeUseCase(repository: gh<_i430.HomeRepository>()));
    gh.factory<_i921.InitialRequestUseCase>(
        () => _i921.InitialRequestUseCase(gh<_i972.AppRepo>()));
    gh.factory<_i382.ProfileBloc>(() => _i382.ProfileBloc(
          gh<_i960.GetProfileUseCase>(),
          gh<_i644.GetAllCouponUseCase>(),
          gh<_i344.LogoutUseCase>(),
          gh<_i709.UpdateProfileUseCase>(),
        ));
    gh.factory<_i722.GetAllAddressUseCase>(
        () => _i722.GetAllAddressUseCase(gh<_i667.AddressRepo>()));
    gh.factory<_i157.UpdateAddressUseCase>(
        () => _i157.UpdateAddressUseCase(gh<_i667.AddressRepo>()));
    gh.factory<_i325.DeleteAdressUseCase>(
        () => _i325.DeleteAdressUseCase(gh<_i667.AddressRepo>()));
    gh.factory<_i211.AddAddressUseCase>(
        () => _i211.AddAddressUseCase(gh<_i667.AddressRepo>()));
    gh.factory<_i212.HomeBloc>(() => _i212.HomeBloc(gh<_i962.HomeUseCase>()));
    gh.factory<_i146.GetAllOrdersUseCase>(
        () => _i146.GetAllOrdersUseCase(gh<_i696.OrderRepository>()));
    gh.factory<_i144.GetOrderDetailsUseCase>(
        () => _i144.GetOrderDetailsUseCase(gh<_i696.OrderRepository>()));
    gh.factory<_i557.OrderBloc>(() => _i557.OrderBloc(
          getAllOrdersUseCase: gh<_i146.GetAllOrdersUseCase>(),
          getOrderDetailsUseCase: gh<_i144.GetOrderDetailsUseCase>(),
        ));
    gh.factory<_i854.GetAllCategoryUseCase>(() => _i854.GetAllCategoryUseCase(
        repository: gh<_i668.CategoryRepository>()));
    gh.factory<_i78.ProductCategoryUseCase>(() => _i78.ProductCategoryUseCase(
        repository: gh<_i668.CategoryRepository>()));
    gh.factory<_i24.GetProductDetailsUseCase>(() =>
        _i24.GetProductDetailsUseCase(
            repository: gh<_i668.CategoryRepository>()));
    gh.factory<_i1033.GetAdressDetailsUseCase>(
        () => _i1033.GetAdressDetailsUseCase(gh<_i1037.AuthRepo>()));
    gh.factory<_i360.RegisterRequestUseCase>(
        () => _i360.RegisterRequestUseCase(gh<_i1037.AuthRepo>()));
    gh.factory<_i451.ChangeStatusNotificationsUsecase>(() =>
        _i451.ChangeStatusNotificationsUsecase(
            gh<_i253.NotificationRepository>()));
    gh.factory<_i371.GetAllNotificationUseCase>(() =>
        _i371.GetAllNotificationUseCase(gh<_i253.NotificationRepository>()));
    gh.factory<_i162.AddUserLocationUseCase>(
        () => _i162.AddUserLocationUseCase(gh<_i1037.AuthRepo>()));
    gh.factory<_i366.AddressBloc>(() => _i366.AddressBloc(
          gh<_i722.GetAllAddressUseCase>(),
          gh<_i325.DeleteAdressUseCase>(),
          gh<_i211.AddAddressUseCase>(),
          gh<_i157.UpdateAddressUseCase>(),
        ));
    gh.factory<_i1052.NotificationBloc>(() => _i1052.NotificationBloc(
          getAllNotifications: gh<_i371.GetAllNotificationUseCase>(),
          changeStatusNotifications:
              gh<_i451.ChangeStatusNotificationsUsecase>(),
        ));
    gh.factory<_i197.AppBloc>(
        () => _i197.AppBloc(gh<_i921.InitialRequestUseCase>()));
    gh.factory<_i213.CategoryBloc>(() => _i213.CategoryBloc(
          gh<_i854.GetAllCategoryUseCase>(),
          gh<_i24.GetProductDetailsUseCase>(),
          gh<_i78.ProductCategoryUseCase>(),
        ));
    gh.factory<_i202.AuthBloc>(() => _i202.AuthBloc(
          gh<_i360.RegisterRequestUseCase>(),
          gh<_i162.AddUserLocationUseCase>(),
          gh<_i1033.GetAdressDetailsUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i535.RegisterModule {}
