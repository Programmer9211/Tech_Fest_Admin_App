import 'package:get/get.dart';

import '../controllers/signin_screen_controller.dart';

class SigninScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninScreenController>(
      () => SigninScreenController(),
    );
  }
}
