import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:either_dart/either.dart';
import '../core/error/app_exception.dart';
import '../core/utils/types.dart';

@singleton
class LocationService {
  Location _location = Location();

  FutureResult<LocationData> currentLocation({
    bool forceToOpenSetting = true,
    bool requestOnlyAlways = false,
    LocationAccuracy accuracy = LocationAccuracy.low,
  }) async {
    if (!await _location.serviceEnabled()) {
      if (!await _location.requestService()) {
        return const Left(AppException(message: 'Location Service is not enabled'));
      }
    }
    final status = await ph.Permission.locationAlways.status;

    if (status.isDenied || status.isLimited || status.isPermanentlyDenied) {
      ph.PermissionStatus per;
     ph.PermissionStatus permissionRequest;

      per = await ph.Permission.location.request();
      permissionRequest = await ph.Permission.locationAlways.request();
      if ((permissionRequest.isGranted)&& (per.isGranted))
       {
         return Left(AppException(message: 'Location permission is not granted'));
       }
    }
    await _location.changeSettings(accuracy: accuracy );
    LocationData location =await _location.getLocation();
    return Right(location);
  }

  Stream<LocationData> get locationUpdates {
    return _location.onLocationChanged;
  }

  void enableBackgroundLocation() => _location.enableBackgroundMode(enable: true);
}
