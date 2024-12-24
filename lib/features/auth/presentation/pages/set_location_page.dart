import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_customer/common/models/page_state/result_builder.dart';
import 'package:restaurant_customer/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:restaurant_customer/generated/l10n.dart';
import 'package:restaurant_customer/services/service_locator.dart';

import '../../../../core/config/theme/extension.dart';
import '../../../app/presentation/widgets/app_appbar.dart';
import '../../../app/presentation/widgets/app_scaffold.dart';
import '../../../app/presentation/widgets/app_text.dart';
import '../../../profile/presentation/widgets/nav_location.dart';
import 'auth_details_locatoin.dart';

class SetLocationPage extends StatefulWidget {
  const SetLocationPage({super.key});
  static const name = "/SetLocationPage";
  static const path = "/SetLocationPage";

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  late GoogleMapController _mapController;
  LatLng _currentPosition = const LatLng(36.2021, 37.1343);
  final Set<Marker> _markers = {};
  String address = 'Searching...';
  late AuthBloc bloc;

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      bloc.add(GetAdressDetailsEvent(_currentPosition));
      _updateMarker(_currentPosition);
      _mapController
          .animateCamera(CameraUpdate.newLatLngZoom(_currentPosition, 13));
    });
  }

  // Method to update the marker at a given position
  void _updateMarker(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId(
            "selected-location",
          ),
          position: position,
          infoWindow: const InfoWindow(title: "Your Selected Location"),
        ),
      );
    });
  }

  // Method to handle user taps on the map
  void _onMapTapped(LatLng tappedPoint) {
    setState(() {
      _currentPosition = tappedPoint;
      _updateMarker(tappedPoint);
      bloc.add(GetAdressDetailsEvent(_currentPosition));
      _mapController.animateCamera(CameraUpdate.newLatLngZoom(tappedPoint, 16));
    });
  }

  // Method to handle map creation
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _getCurrentLocation();
  }

  @override
  void initState() {
    bloc = getIt<AuthBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: AppScaffold(
        appBar: AppAppBar(
          actions: [
            AppText(
              S.of(context).Locate,
              style: context.textTheme.bodyLarge,
              color: const Color(0xFF333333),
            ),
            10.horizontalSpace,
            InkWell(
              onTap: () => context.pop(context),
              child: Icon(
                Icons.arrow_forward_ios,
                color: context.colorScheme.onSurface.withOpacity(.8),
              ),
            ),
            10.horizontalSpace,
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _currentPosition,
            zoom: 10,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: _markers,
          onTap: _onMapTapped, // Allow users to tap and select a new location
        ),
        bottomNavigationBar: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return PageStateBuilder(
              init: Container(),
              success: (data) => SafeArea(
                child: NavLocationPage(
                  onPressed: () {
                    context.pushNamed(
                      AuthDetailsLocatoin.name,
                      extra: _currentPosition,
                    );
                  },
                  title: data.city,
                  subTitle: data.street,
                ),
              ),
              loading: const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error) => Container(),
              result: state.getAdressDetails,
              empty: Container(),
            );
          },
        ),
      ),
    );
  }
}
