import 'package:attendance_with_location/app/home/views/home_view.dart';
import 'package:attendance_with_location/app/login/services/login_services.dart';
import 'package:attendance_with_location/core/utils/location_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController {
  late PageController pageController;
  late BuildContext context;
  late TextEditingController phoneController;
  late TextEditingController smsCodeController;
  late LoginServices loginServices;
  late String countryKey;

  LoginController(this.context) {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    phoneController = TextEditingController();
    smsCodeController = TextEditingController();
    loginServices = LoginServices();
    countryKey = '+966';
    LocationUtil.determinePosition();
  }

  String? smsValidator(String? sms) {
    if (((sms?.length ?? 0) < 6) || sms != '0000') return "Incorrect SMS Code";
    return null;
  }

  void navigateToNextPage() {
    pageController.nextPage(
      duration: const Duration(
        milliseconds: 200,
      ),
      curve: Curves.ease,
    );
  }

  Future<void> loginController() async {
    String page = pageController.page!.toString();
    switch (page) {
      case "0.0":
        {
          phoneController.text = countryKey + phoneController.text;
          loginServices.login(phoneController.text);
          navigateToNextPage();
        }
        break;

      case "1.0":
        {
          if (await loginServices.verifyCode(smsCodeController.text) != '') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            );
          }
        }
        break;

      default:
        {

        }
        break;
    }
  }
}
