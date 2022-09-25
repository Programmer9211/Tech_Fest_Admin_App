import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/authentication_screen_controller.dart';

class AuthenticationScreenView extends GetView<AuthenticationScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
