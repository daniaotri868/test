import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../../generated/flutter_gen/assets.gen.dart';
import '../../../../generated/l10n.dart';
import '../../../../services/location_service.dart';
import '../../../../services/service_locator.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_image.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../data/models/address_model.dart';
import '../../../profile/presentation/widgets/nav_location.dart';
import 'details_location.dart';


class LocationPage extends StatefulWidget {
  static const name = "locationPage";
  static const path = "locationPage";

  const LocationPage({Key? key,required this.param}) : super(key: key);
  final AddLocationPageParams param;
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController googleMapController;

  Location _locationController = new Location();
  ValueNotifier<LatLng?> currentP = ValueNotifier(null);
  Set<Marker> markers = {};
  double? lat;
  double? long;
late ProfileBloc bloc;
  @override
  void initState() {
    bloc = getIt<ProfileBloc>();
    widget.param.locationModel == null
        ? getLocatoinUpdate()
        : currentP.value = LatLng(widget.param.locationModel!.lat??0,
        widget.param.locationModel!.lon??0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: AppScaffold(
        extendBody: true,
        appBar: AppAppBar(
          label: S.current.AddNewAddress,
          leading: InkWell(
              onTap: () => context.pop(context),
              child: Icon(Icons.arrow_back_ios,
                color: context.colorScheme.onSurface.withOpacity(.8),)),
        ),
        body: ValueListenableBuilder(
          valueListenable: currentP,
          builder: (context, value, child) {
            return value == null
                ? Center(
              child: CircularProgressIndicator(
                color: context.colorScheme.primary,
              ),
            )
                : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentP.value!,
                zoom: 13,
              ),
              mapType: MapType.normal,
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocatoin'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: value,
                ),
              },
              onTap: (argument) {
                currentP.value = argument;
              },
            );
          },
        ),
        floatingActionButton: Stack(
          children: [
            Positioned(
              bottom: 475.h,
              right: 26.w,
              child: FloatingActionButton(
                heroTag: "btn1",
                backgroundColor: context.colorScheme.onPrimary,
                shape: const CircleBorder(),
                onPressed: () {},
                child: AppImage.asset(Assets.icons.iconSearch.path),
              ),
            ),
            Positioned(
              bottom: 45.h,
              right: 26.w,
              child: FloatingActionButton(
                heroTag: "btn2",
                backgroundColor: context.colorScheme.primary,
                shape: const CircleBorder(),
                onPressed: getLocatoinUpdate,
                child: const Icon(Icons.my_location_sharp),
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavLocationPage(
          onPressed: () {
            context.pushNamed(
              DetailsLocation.name,
              extra:AddLocationDetailsParam(profileOrCart: widget.param.profileOrCart!,latLng: currentP.value!,locationModel: widget.param.locationModel),
            );
          },
          title: 'حلب',
          subTitle: 'الفرقان -شارع الاكسبريس',
        ),
      ),
    );
  }

  Future<void> getLocatoinUpdate() async {
    LocationService locationService=LocationService();
    final result = await locationService.currentLocation();

    return result.fold((left) async {

    },
            (position) async {
          setState(() {
            currentP.value =  LatLng(position.latitude!, position.longitude!);

          });
        });

  }

}

class AddLocationPageParams {

  final bool? profileOrCart;
  final AddressModel? locationModel;



  AddLocationPageParams({required this.profileOrCart, this.locationModel});
}

