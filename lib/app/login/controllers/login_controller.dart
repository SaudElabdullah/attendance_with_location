import 'package:attendance_with_location/app/home/views/home_view.dart';
import 'package:attendance_with_location/app/login/services/login_services.dart';
import 'package:attendance_with_location/core/utils/location_util.dart';
import 'package:attendance_with_location/core/utils/pop_up.dart';
import 'package:flutter/material.dart';

class LoginController {
  late PageController pageController;
  late BuildContext context;
  late TextEditingController phoneController;
  late TextEditingController smsCodeController;
  late LoginServices loginServices;
  late bool showLottie;
  late String countryKey;
  late State state;

  LoginController({
    required this.context,
    required this.state,
  }) {
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    phoneController = TextEditingController();
    smsCodeController = TextEditingController();
    loginServices = LoginServices();
    countryKey = '+966';
    showLottie = false;
  }

  String? smsValidator(String? sms) {
    if (((sms?.length ?? 0) < 6)) return "Incorrect SMS Code";
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
          loginServices.login(countryKey + phoneController.text);
          navigateToNextPage();
        }
        break;

      case "1.0":
        {
          state.setState(() {
            showLottie = true;
          });
          Future.wait([
            LocationUtil.determinePosition(),
            loginServices.verifyCode(smsCodeController.text),
          ]).then((value) async {
            if (value[1] != '') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
              );
            } else {
              state.setState(() {
                showLottie = false;
              });
              await showAlert(
                context: context,
                isDismissible: true,
                buttonText: 'Done',
                title: 'SMS Code',
                messageOne: 'The SMS Code you entered is incorrect',
                messageTwo: 'Please renter it again',
              );
            }
          });
        }
        break;

      default:
        {}
        break;
    }
  }
}
