import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_customer/features/app/data/repositories/prefs_repository_impl.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/app/presentation/widgets/error_widget.dart';
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:restaurant_customer/features/home/presentaion/bloc/home_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../../services/location_service.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../app/presentation/widgets/empty_widget.dart';
import '../../../app/presentation/widgets/loading_widget.dart';
import '../../../category/presentaion/pages/all_category.dart';
import '../widget/appbar_with_cart.dart';
import '../widget/offer_slider.dart';
import '../widget/section_category.dart';
import '../widget/section_product_home.dart';

class Home extends StatefulWidget {
  static String name="/Home";
  static String path="/Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocationService locationService=LocationService();
  Location location = new Location();
  LatLng currentP = const LatLng(0, 0);
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await _getCurrentLocation();
      context.read<HomeBloc>().add(GetHomeDataEvent(
        long: currentP?.longitude,
        late: currentP?.latitude,
      ));
      final token = await StorageRepositoryImpl().token;
      if(token!=null){
      context.read<CartBloc>().add(GetCartEvent());}
    });


  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      return PageStateBuilder(
          init: Container(),
          success: (data) {
            return RefreshIndicator(
              onRefresh: () async{
                context.read<HomeBloc>().add(GetHomeDataEvent(
                  long: currentP?.longitude,
                  late: currentP?.latitude,
                ));
                context.read<CartBloc>().add(GetCartEvent());
              },
              child: AppScaffold(
                backgroundColor: context.colorScheme.background,
                appBar: AppBarWithCart(height: 170,listStore: data.stores??[],toolbarHeight: 100,background:context.colorScheme.background ,isHome: true,),
                body:Padding(
                  padding: REdgeInsetsDirectional.only(start: 24,end: 7),
                  child: ListView(
                    children: [
                      OfferSlider(listBanner: data.banners?.data??[],),
                      TextButton(onPressed: () {
                        context.pushNamed(AllCategory.name);
                      },
                        style: const ButtonStyle(
                          alignment: Alignment.topLeft
                        ),
                        child: AppText.bodySmall(S.current.see_all).copyWith(color: context.colorScheme.primary),),
                      SectionCategory(
                        listCategory: data.categories?.data??[],
                      ),
                      20.verticalSpace,
                      SectionProductHome(title: S.current.recently_added_products,listProduct: data.lastItems?.data??[],),
                      20.verticalSpace,
                      SectionProductHome(title: S.current.offers,withBorder: true,listProduct: data.offers?.data??[],)
                    ],
                  ),
                ) ,
              ),
            );
          },
          loading: const AppScaffold(body: LoadingWidget(),),
          error:(error) =>  AppScaffold(body: ErrorWidgetPage(onPressed: () {
            context.read<HomeBloc>().add(GetHomeDataEvent(
              long: currentP?.longitude,
              late: currentP?.latitude,
            ));
            context.read<CartBloc>().add(GetCartEvent());
            },),),
          result: state.getAllHomeData,
          empty: const AppScaffold(body: EmptyWidget(),));
    },
    );
  }
  Future<void> getLocation() async {
    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return ;
      }
    }
    final status = await location.hasPermission();
    if (status == PermissionStatus.denied) {
      final permissionRequest = await location.requestPermission();

      if (permissionRequest != PermissionStatus.granted) {
        return;
      }
    }
    final currentLocation = await location.getLocation();
    setState(() {
      currentP =  LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });
    return ;
  }
  Future<void> _getCurrentLocation() async {
    final result = await locationService.currentLocation();

    return result.fold((left) async {

    },
            (position) async {
      setState(() {
        currentP =  LatLng(position.latitude!, position.longitude!);

      });
    });
  }

  }



