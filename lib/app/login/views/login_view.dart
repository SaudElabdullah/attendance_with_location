import 'package:attendance_with_location/app/login/controllers/login_controller.dart';
import 'package:attendance_with_location/app/login/views/pages/phone_number_page.dart';
import 'package:attendance_with_location/app/login/views/pages/pin_code_page.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;

  @override
  initState() {
    controller = LoginController(context,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 150,
              child: Row(
                children: const [
                  Text(
                    'Quiz U',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  Icon(
                    Icons.person,
                    size: 35,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 350,
              right: 35,
              left: 35,
              height: 200,
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
