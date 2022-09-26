import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:tech_fest_admin_app/app/data/generate_id.dart';
import 'package:tech_fest_admin_app/app/data/get_storage/get_storage.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';
import 'package:tech_fest_admin_app/app/models/event_model.dart';
import 'package:tech_fest_admin_app/app/modules/create_event/db_functions/db_functions.dart';
import 'package:tech_fest_admin_app/const/app_const/app_keys.dart';
import 'package:tech_fest_admin_app/const/app_const/participant_detals_list.dart';

class CreateEventController extends GetxController {
  final TextEditingController eventTitleController = TextEditingController();
  final TextEditingController eventDescController = TextEditingController();
  final TextEditingController eventVenueController = TextEditingController();
  final TextEditingController eventTimingsController = TextEditingController();
  final TextEditingController teamMemberCount = TextEditingController();

  RxBool isTeam = false.obs;

  List<ParticipantsDetails> participantDetails = [];
  @override
  void onInit() {
    super.onInit();
    participantDetails = participantsDetails;
  }

  void onSeletedAndUnSelectCalue(bool value, int index) {
    participantDetails[index].isEnabled = value;
    update();
  }

  void onLaunchEvents() async {
    if (eventTitleController.text.isNotEmpty &&
        eventDescController.text.isNotEmpty &&
        eventVenueController.text.isNotEmpty) {
      int teamMembers = 0;

      try {
        teamMembers = int.parse(teamMemberCount.text);
      } catch (e) {
        Indicator.showSnackBar("Please Enter a valid member count");
      }

      List<Location> locations =
          await locationFromAddress("Gronausestraat 710, Enschede");

      EventModel eventModel = EventModel(
        id: generateId(),
        uid: Storage.getValue(AppKeys.uid),
        eventImages: [],
        eventTitle: eventTitleController.text,
        eventDescription: eventDescController.text,
        teamMembers: isTeam.value ? teamMembers : 0,
        eventLocation: EventLocation(
          address: eventVenueController.text,
          lat: locations.first.latitude,
          long: locations.first.longitude,
        ),
        registrationFees: "0",
        participantDetails: [],
      );

      await CreateEventFunctions.createEventDetails(eventModel);
    }
  }
}
