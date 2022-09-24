import 'package:attendance_with_location/app/home/views/home_view.dart';
import 'package:attendance_with_location/app/login/views/login_view.dart';
import 'package:attendance_with_location/core/utils/location_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreenController {
  late BuildContext context;
  late bool isLoggedIn;

  SplashScreenController({
    required this.context,
  });

  void preLunch(){
    Future.wait(
      [
        loggedIn(),
        LocationUtil.determinePosition(),
        Future.delayed(
          const Duration(
            milliseconds: 500,
          ),
        ),
      ],
    ).then((value) => lunch());
  }

  Future<void> loggedIn() async {
    if (await FirebaseAuth.instance.currentUser != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
  }

  void lunch() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(
          milliseconds: 1000,
        ),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
        pageBuilder: (_, __, ___) => isLoggedIn ? const HomeView() : const LoginView(),
      ),
    );
  }
}
