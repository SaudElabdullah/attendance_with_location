import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:attendance_with_location/app/login/controllers/login_controller.dart';

class PhoneNumberPage extends StatelessWidget {
  final LoginController controller;

  const PhoneNumberPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller.phoneController,
      onCountryChanged: (country){
        controller.countryKey = country.code;
      },
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: 'SA',
    );
  }
}
