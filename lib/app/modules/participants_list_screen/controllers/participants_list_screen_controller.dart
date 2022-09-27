import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';
import 'package:tech_fest_admin_app/app/models/user_model.dart';
import 'package:tech_fest_admin_app/app/modules/participants_list_screen/db_functions/db_functions.dart';

class ParticipantsListScreenController extends GetxController {
  List<UserModel> participantsList = [];
  String _id = "";

  @override
  void onInit() {
    super.onInit();
    _id = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
    getAllParticipantsList();
  }

  void getAllParticipantsList() async {
    Indicator.showLoading();

    List<UserModel>? model =
        await ParticipantsListFunctions.getParticipantsList(_id);

    if (model != null) {
      participantsList = model;
      update();
    }

    Indicator.closeLoading();
  }
}
