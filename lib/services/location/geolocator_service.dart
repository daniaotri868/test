import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/error/app_exception.dart';

class GeolocatorService {
  static Future<bool> requestLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await Permission.location.request().isGranted;
      if (!serviceEnabled) {
        throw LocationPermissionException('Location services are disabled.');
      }
    }

    permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.always) {
      await Permission.locationAlways.request();
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionException('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Permission.locationAlways.request();
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.deniedForever) {
        throw LocationPermissionException(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }

    return true;
  }

  static void startLocationStream(Function(Position position) onData) {
    const LocationSettings locationSettings =
        LocationSettings(accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 10);

    Geolocator.getPositionStream(locationSettings: locationSettings).listen(onData);
  }
}
