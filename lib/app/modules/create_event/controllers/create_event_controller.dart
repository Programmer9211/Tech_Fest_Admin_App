import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateEventController extends GetxController {
  final TextEditingController eventTitleController = TextEditingController();
  final TextEditingController eventDescController = TextEditingController();
  final TextEditingController eventVenueController = TextEditingController();
  final TextEditingController eventTimingsController = TextEditingController();

  final bool isTeam = false;

  final bool isParticipantName = true;
  final bool isPhoneNumber = false;
  final bool isCollegeName = false;
  final bool isInstitutionID = true;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
