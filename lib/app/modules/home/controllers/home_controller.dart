import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';
import 'package:tech_fest_admin_app/app/models/event_model.dart';
import 'package:tech_fest_admin_app/app/modules/home/db_functions/db_functions.dart';

class HomeController extends GetxController {
  List<EventModel> eventModelList = [];

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getAllEvents();
  }

  void getAllEvents() async {
    Indicator.showLoading();

    List<EventModel>? model = await HomeFunctions.getOrganiserEvents();

    if (model != null) {
      eventModelList = model;
      update();
    }

    Indicator.closeLoading();
  }
}
