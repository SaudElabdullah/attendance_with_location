import 'package:geolocator/geolocator.dart';

class LocationUtil {
  static late Position? currentPosition;

  static Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    currentPosition = await Geolocator.getCurrentPosition();
    return currentPosition;
  }

  static bool verifyLocation(Position intendedPosition, double acceptedDistance) {
    return acceptedDistance >
        Geolocator.distanceBetween(
          currentPosition?.latitude ?? intendedPosition.latitude,
          currentPosition?.longitude ?? intendedPosition.longitude,
          intendedPosition.latitude,
          intendedPosition.longitude,
        );
  }
}
