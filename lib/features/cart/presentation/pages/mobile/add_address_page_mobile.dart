import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_customer/core/config/theme/extension.dart';
import 'package:restaurant_customer/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:restaurant_customer/generated/l10n.dart';


import '../../../../../services/location_service.dart';
import '../../../../app/presentation/widgets/app_appbar.dart';
import '../../../../app/presentation/widgets/app_scaffold.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class AddAddressPageMobile extends StatefulWidget {
  const AddAddressPageMobile({super.key});

  @override
  State<AddAddressPageMobile> createState() => _AddAddressPageMobileState();
}

class _AddAddressPageMobileState extends State<AddAddressPageMobile> {
  final CartBloc bloc = GetIt.I<CartBloc>();
final LocationService locationService =LocationService();
  late GoogleMapController _mapController;
  LatLng? _currentPosition;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    _getCurrentLocation();

    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    final result = await locationService.currentLocation();

    return result.fold((left) async {

    }, (position) async {
      setState(() {
        _currentPosition = LatLng(position.latitude!, position.longitude!);
        _updateMarker(_currentPosition!);
        _mapController
            .animateCamera(CameraUpdate.newLatLngZoom(_currentPosition!, 13));
      });
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
          icon: BitmapDescriptor.defaultMarker,
          position: position,
          infoWindow: InfoWindow(title: S.current.Your_selected_location),
        ),
      );
    });
  }

  // Method to handle user taps on the map
  void _onMapTapped(LatLng tappedPoint) {
    setState(() {
      _currentPosition = tappedPoint;
      _updateMarker(tappedPoint);
      _mapController.animateCamera(CameraUpdate.newLatLngZoom(tappedPoint, 16));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: AppScaffold(
        appBar: AppAppBar(
          actions: [
            AppText(
              S.of(context).Add_a_new_address,
              style: context.textTheme.bodyLarge,
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
        body: _currentPosition == null
            ? Center(
                child: AppText(
                  'loading...',
                  color: context.colorScheme.primary,
                ),
              )
            : GoogleMap(
                onMapCreated: (controller) => _mapController = controller,
                initialCameraPosition: CameraPosition(
                  target: _currentPosition!,
                  zoom: 10,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: _markers,
                onTap:
                    _onMapTapped, // Allow users to tap and select a new location
              ),
      ),
    );
  }
}
