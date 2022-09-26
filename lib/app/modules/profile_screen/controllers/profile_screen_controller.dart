import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';
import 'package:tech_fest_admin_app/app/models/coordinator_model.dart';
import 'package:tech_fest_admin_app/app/modules/profile_screen/db_functions/db_functions.dart';

class ProfileScreenController extends GetxController {
  late CoordinatorModel coordinatorModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    coordinatorModel = CoordinatorModel(
      uid: "",
      name: "name",
      email: "email",
    );
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getCoordinatorDetails();
  }

  void getCoordinatorDetails() async {
    Indicator.showLoading();

    CoordinatorModel? model = await ProfileFunctions.getUserProfileDetail();

    if (model != null) {
      coordinatorModel = model;
    }

    Indicator.closeLoading();
  }
}
