import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_customer/features/profile/data/model/profile_model.dart';
import '../../features/address/presentation/pages/details_location.dart';
import '../../features/address/presentation/pages/location_page.dart';
import '../../features/auth/presentation/pages/add_personal_info_page.dart';
import '../../features/auth/presentation/pages/allow_location_page.dart';
import '../../features/auth/presentation/pages/auth_details_locatoin.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/set_location_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/welcom_page.dart';
import 'package:restaurant_customer/features/home/presentaion/pages/home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../features/auth/presentation/pages/add_personal_info_page.dart';
import '../../features/auth/presentation/pages/allow_location_page.dart';
import '../../features/auth/presentation/pages/auth_details_locatoin.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/set_location_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/welcom_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/cart/presentation/pages/saved_address_page.dart';
import '../../features/cart/presentation/pages/saved_coupon_page.dart';
import '../../features/category/presentaion/pages/all_category.dart';
import '../../features/category/presentaion/pages/details_product.dart';
import '../../features/category/presentaion/pages/product_category.dart';
import '../../features/app/presentation/pages/base.dart';
import '../../features/home/presentaion/pages/home.dart';
import '../../features/notification/presentation/pages/notification_page.dart';
import '../../features/order/presentation/pages/order_details_page.dart';
import '../../features/order/presentation/pages/order_page.dart';
import '../../features/profile/presentation/pages/about_app.dart';
import '../../features/profile/presentation/pages/my_account_page.dart';
import '../../features/profile/presentation/pages/my_address.dart';
import '../../features/profile/presentation/pages/my_coupon.dart';
import '../../features/profile/presentation/pages/profile.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final router = GoRouter(
    observers: [AnalyticsRouteObserver()],
    initialLocation: SplashPage.path,
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: SplashPage.path,
        name: SplashPage.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: Welcome.path,
        name: Welcome.name,
        builder: (context, state) => const Welcome(),
      ),
      GoRoute(
        path: RegisterPage.path,
        name: RegisterPage.name,
        builder: (context, state) => const RegisterPage(),
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state, child) {
          return BasePage(child: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                  builder: (context, state) => const Home(),
                  path: Home.path,
                  name: Home.name,
                  routes: [
                    GoRoute(
                      parentNavigatorKey:rootNavigatorKey ,
                      path: CartPage.path,
                      name: CartPage.name,
                      builder: (context, state) => const CartPage(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey:rootNavigatorKey ,
                          path: SavedAddressPage.path,
                          name: SavedAddressPage.name,
                          builder: (context, state) => const SavedAddressPage(),
                        ),
                        GoRoute(
                          parentNavigatorKey:rootNavigatorKey ,
                          path: SavedCouponPage.path,
                          name: SavedCouponPage.name,
                          builder: (context, state) => const SavedCouponPage(),
                        ),
                      ]),
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: DetailsProduct.path,
                    name: DetailsProduct.name,
                    builder: (context, state) => DetailsProduct(
                      id: state.extra as String,
                    ),
                  ),
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: AllCategory.path,
                    name: AllCategory.name,
                    builder: (context, state) => const AllCategory(),
                  ),
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: ProductCategory.path,
                    name: ProductCategory.name,
                    builder: (context, state) => ProductCategory(
                      id: state.extra as String,
                    ),
                  ),
                ]),
          ],
        ),
        // 2
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/NotificationPage.path',
              name: '/NotificationPage.name',
              builder: (context, state) => const NotificationPage(),
            ),
          ],
        ),
        // 3
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: NotificationPage.path,
              name: NotificationPage.name,
              builder: (context, state) => const NotificationPage(),
            ),
          ],
        ),
        // 4
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: ProfilePage.path,
                name: ProfilePage.name,
                builder: (context, state) => const ProfilePage(),
                routes: [
                  GoRoute(
                      parentNavigatorKey:rootNavigatorKey ,
                      path: OrderPage.path,
                      name: OrderPage.name,
                      builder: (context, state) => const OrderPage(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey:rootNavigatorKey ,
                          path: OrderDetailsPage.path,
                          name: OrderDetailsPage.name,
                          builder: (context, state) =>  OrderDetailsPage(orderId: state.extra as String,),
                        ),

                      ]
                  ),
                  GoRoute(
                    parentNavigatorKey:rootNavigatorKey ,
                    path: MyAccountPage.path,
                    name: MyAccountPage.name,
                    builder: (context, state) =>  MyAccountPage(param: state.extra as ProfileParam,),
                  ),
                  GoRoute(
                      parentNavigatorKey:rootNavigatorKey ,
                      path: MyAddress.path,
                      name: MyAddress.name,
                      builder: (context, state) => const MyAddress(),
                      routes: [
                        GoRoute(
                            parentNavigatorKey:rootNavigatorKey ,
                            path: LocationPage.path,
                            name: LocationPage.name,
                            builder: (context, state) =>  LocationPage(param: state.extra as AddLocationPageParams,),
                            routes: [
                              GoRoute(
                                parentNavigatorKey:rootNavigatorKey ,
                                path: DetailsLocation.path,
                                name: DetailsLocation.name,
                                builder: (context, state) =>  DetailsLocation(param: state.extra as AddLocationDetailsParam,),

                              ),
                            ]),
                      ]),
                  GoRoute(
                    parentNavigatorKey:rootNavigatorKey ,
                    path: MyCoupon.path,
                    name: MyCoupon.name,
                    builder: (context, state) =>  MyCoupon(),
                  ),
                  GoRoute(
                    parentNavigatorKey:rootNavigatorKey ,
                    path: AboutApp.path,
                    name: AboutApp.name,
                    builder: (context, state) => const AboutApp(),
                  ),
                ]),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey:rootNavigatorKey ,
      path: AllowLocationPage.path,
      name: AllowLocationPage.name,
      builder: (context, state) => const AllowLocationPage(),
    ),
    GoRoute(
      parentNavigatorKey:rootNavigatorKey ,
      path: SetLocationPage.path,
      name: SetLocationPage.name,
      builder: (context, state) => const SetLocationPage(),
    ),
    GoRoute(
      parentNavigatorKey:rootNavigatorKey ,
      path: AddPersonalInfoPage.path,
      name: AddPersonalInfoPage.name,
      builder: (context, state) => AddPersonalInfoPage(
        emailUser: state.extra as String,
      ),
    ),
    GoRoute(
      path: AuthDetailsLocatoin.path,
      name: AuthDetailsLocatoin.name,
      builder: (context, state) => AuthDetailsLocatoin(
        locatoin: state.extra as LatLng,
      ),
    ),
  ],
);

Page<dynamic> _pageBuilder<T>(
        {required GoRouterState state, required Widget child}) =>
    Platform.isIOS
        ? CupertinoPage<T>(child: child, key: state.pageKey)
        : MaterialPage<T>(child: child, key: state.pageKey);

class AnalyticsRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {}
}

extension GoRouterBc on GoRouter {
  BuildContext? get context => routerDelegate.navigatorKey.currentContext;
}
