import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/authentication/authentication.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';
import 'package:tech_fest_admin_app/app/routes/app_pages.dart';

class SignupScreenController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  final isChecked = false;

  void onSignup() async {
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        name.text.isNotEmpty) {
      Indicator.showLoading();
      await AuthenticationService().userRegistration(
        email.text,
        password.text,
        name.text,
      );

      Indicator.closeLoading();

      Get.offAllNamed(Routes.AUTHENTICATION_SCREEN);
    }
  }
}
