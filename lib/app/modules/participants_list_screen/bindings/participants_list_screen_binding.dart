import 'package:get/get.dart';

import '../controllers/participants_list_screen_controller.dart';

class ParticipantsListScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParticipantsListScreenController>(
      () => ParticipantsListScreenController(),
    );
  }
}
