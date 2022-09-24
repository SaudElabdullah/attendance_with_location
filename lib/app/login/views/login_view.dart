import 'package:attendance_with_location/app/login/controllers/login_controller.dart';
import 'package:attendance_with_location/app/login/views/pages/phone_number_page.dart';
import 'package:attendance_with_location/app/login/views/pages/pin_code_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;

  @override
  initState() {
    controller = LoginController(
      context: context,
      state: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            if (controller.showLottie) ...[
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(
                    0.2,
                  ),
                  child: Lottie.asset(
                    'assets/lotties/loading.json',
                    repeat: true,
                    animate: true,
                    frameRate: FrameRate.max,
                  ),
                ),
              ),
            ],
            Positioned(
              top: 150,
              child: Row(
                children: const [
                  Text(
                    'Attendance',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    size: 40,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 350,
              right: 35,
              left: 35,
              height: 300,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                children: [
                  PhoneNumberPage(
                    controller: controller,
                  ),
                  PinCodePage(
                    controller: controller,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 200,
              right: 80,
              left: 80,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blueGrey,
                  ),
                ),
                onPressed: () async {
                  await controller.loginController();
                },
                child: const SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      'next',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
