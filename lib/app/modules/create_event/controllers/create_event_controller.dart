import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tech_fest_admin_app/app/data/firebase_image_uploading.dart';
import 'package:tech_fest_admin_app/app/data/generate_id.dart';
import 'package:tech_fest_admin_app/app/data/get_storage/get_storage.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';
import 'package:tech_fest_admin_app/app/models/date_time_model.dart';
import 'package:tech_fest_admin_app/app/models/event_model.dart';
import 'package:tech_fest_admin_app/app/modules/create_event/db_functions/db_functions.dart';
import 'package:tech_fest_admin_app/app/modules/home/controllers/home_controller.dart';
import 'package:tech_fest_admin_app/const/app_const/app_keys.dart';
import 'package:tech_fest_admin_app/const/app_const/participant_detals_list.dart';

class CreateEventController extends GetxController {
  final TextEditingController eventTitleController = TextEditingController();
  final TextEditingController eventDescController = TextEditingController();

  final TextEditingController eventVenueController = TextEditingController();
  final TextEditingController registrationFees = TextEditingController();
  final TextEditingController teamMemberCount = TextEditingController();
  final TextEditingController contactDetails = TextEditingController();
  final TextEditingController emailId = TextEditingController();
  final TextEditingController websiteLink = TextEditingController();
  late DateTimeModel eventStartTimings, eventEndTimings;

  RxBool isTeam = false.obs;
  List<String> eventImageUrl = [];
  List<File> pickedImageFile = [];
  List<RxBool> isSelected = [];

  List<ParticipantsDetails> participantDetails = [];
  @override
  void onInit() {
    super.onInit();
    participantDetails = participantsDetails;
    eventStartTimings = DateTimeModel.init();
    eventEndTimings = DateTimeModel.init();
  }

  void onPageChanged(int value) {
    for (var element in isSelected) {
      element.value = false;
    }

    isSelected[value].value = true;
  }

  void onSeletedAndUnSelectCalue(bool value, int index) {
    participantDetails[index].isEnabled = value;
    update();
  }

  void onLaunchEvents() async {
    if (eventTitleController.text.isNotEmpty &&
        eventDescController.text.isNotEmpty &&
        eventVenueController.text.isNotEmpty) {
      Indicator.showLoading();

      int teamMembers = 0;

      try {
        teamMembers = int.parse(teamMemberCount.text);
      } catch (e) {
        Indicator.showSnackBar("Please Enter a valid member count");
      }

      List<Location> locations = [];

      try {
        locations = await locationFromAddress(eventVenueController.text);

        print(locations.first.latitude);
        print(locations.first.longitude);
      } catch (e) {
        print(e);
      }

      for (var element in pickedImageFile) {
        String? imageUrl = await FirebaseFileUploading.uploadImage(element);

        if (imageUrl != null) {
          eventImageUrl.add(imageUrl);
        }
      }

      EventModel eventModel = EventModel(
        id: generateId(),
        uid: Storage.getValue(AppKeys.uid),
        eventImages: eventImageUrl,
        eventTitle: eventTitleController.text,
        eventDescription: eventDescController.text,
        teamMembers: isTeam.value ? teamMembers : 0,
        eventLocation: EventLocation(
          address: eventVenueController.text,
          lat: locations.first.latitude,
          long: locations.first.longitude,
        ),
        registrationFees: 0,
        participantsDetails: participantDetails,
        eventStartTimings: eventEndTimings,
        eventEndTimings: eventEndTimings,
        participants: 0,
        eventContactDetails: EventContactDetails(
          phoneNo: contactDetails.text,
          email: emailId.text,
          websiteLink: websiteLink.text,
        ),
      );

      await CreateEventFunctions.createEventDetails(eventModel);

      Get.find<HomeController>().eventModelList.add(eventModel);

      Indicator.closeLoading();

      Indicator.showSnackBar("Event Created Sucessfully");
    }
  }

  void onAddEventTimings(BuildContext context, bool isStartTime) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null && date != null) {
      if (isStartTime) {
        eventStartTimings =
            DateTimeModel.convertInReadableFormat(date, time, context);
      } else {
        eventEndTimings =
            DateTimeModel.convertInReadableFormat(date, time, context);
      }
    }

    update();
  }

  void pickImage() async {
    await ImagePicker.platform.pickMultiImage(imageQuality: 40).then((value) {
      if (value != null) {
        pickedImageFile = value.map((e) => File(e.path)).toList();
        for (var element in pickedImageFile) {
          isSelected.add(false.obs);
          isSelected.first = true.obs;
        }
        update();
      }
    });
  }
}
