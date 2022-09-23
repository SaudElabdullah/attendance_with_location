import 'package:attendance_with_location/core/utils/location_util.dart';
import 'package:geolocator/geolocator.dart';

class HomeController {
  late bool inPlace;
  late Position intendedPosition;

  HomeController() {
    intendedPosition = Position(
      longitude: 24.830755794540078,
      latitude: 46.63732127193435,
      timestamp: DateTime.now(),
      accuracy: 1,
      altitude: 1,
      heading: 1,
      speed: 1,
      speedAccuracy: 1,
    );
    inPlace = LocationUtil.verifyLocation(
      intendedPosition,
      150,
    );
  }
}
