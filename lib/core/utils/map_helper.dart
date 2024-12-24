import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapHelper {
  static setCameraPosition({
    required GoogleMapController controller,
    required LatLng start,
    required LatLng destination,
  }) {
    double minY = (start.latitude <= destination.latitude) ? start.latitude : destination.latitude;
    double minx = (start.longitude <= destination.longitude) ? start.longitude : destination.longitude;
    double maxY = (start.latitude <= destination.latitude) ? destination.latitude : start.latitude;
    double maxX = (start.longitude <= destination.longitude) ? destination.longitude : start.longitude;

    double southWestLatitude = minY;
    double southWestLongitude = minx;

    double northEastLatitude = maxY;
    double northEastLongitude = maxX;

    final latLngBounds = CameraUpdate.newLatLngBounds(
      LatLngBounds(
        northeast: LatLng(northEastLatitude, northEastLongitude),
        southwest: LatLng(southWestLatitude, southWestLongitude),
      ),
      110.0,
    );

    controller.animateCamera(latLngBounds).then((value) => _check(latLngBounds, controller));
  }

  static void _check(CameraUpdate cameraUpdate, GoogleMapController controller) async {
    controller.animateCamera(cameraUpdate);
    controller.animateCamera(cameraUpdate);
    LatLngBounds l1 = await controller.getVisibleRegion();
    LatLngBounds l2 = await controller.getVisibleRegion();
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) _check(cameraUpdate, controller);
  }

  static LatLng midPoint({
    required LatLng start,
    required LatLng destination,
  }) {
    return LatLng(
      (start.latitude + destination.latitude) / 2,
      (start.longitude + destination.longitude) / 2,
    );
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    var ic = (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer;

    return ic.asUint8List();
  }
}
