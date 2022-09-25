import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/routes/app_pages.dart';

class AuthenticationScreenController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    if (FirebaseAuth.instance.currentUser != null) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SIGNIN_SCREEN);
    }
  }
}
