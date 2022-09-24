import 'package:attendance_with_location/app/home/services/home_services.dart';
import 'package:attendance_with_location/app/login/views/login_view.dart';
import 'package:attendance_with_location/core/utils/location_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomeController {
  late bool inPlace;
  late Position intendedPosition;
  late BuildContext context;

  HomeController({
    required this.context,
  }) {
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
    if(inPlace){
      HomeServices.recorde('In place');
    } else {
      HomeServices.recorde('Not in place');
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginView(),
      ),
    );
  }
}
