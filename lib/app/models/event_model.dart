import 'package:tech_fest_admin_app/app/models/date_time_model.dart';

class EventModel {
  late String id;
  late String uid;
  late List<String> eventImages;
  late String eventTitle;
  late String eventDescription;
  late int teamMembers;
  late EventLocation eventLocation;
  late DateTimeModel eventStartTimings;
  late DateTimeModel eventEndTimings;
  late int registrationFees;
  late List<ParticipantsDetails> participantsDetails;

  EventModel({
    required this.id,
    required this.uid,
    required this.eventImages,
    required this.eventTitle,
    required this.eventDescription,
    required this.teamMembers,
    required this.eventLocation,
    required this.registrationFees,
    required this.participantsDetails,
    required this.eventEndTimings,
    required this.eventStartTimings,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    eventImages = json['event_images'].cast<String>();
    eventTitle = json['event_title'];
    eventDescription = json['event_description'];
    teamMembers = json['team_members'];
    eventLocation = EventLocation.fromJson(json['event_location']);
    registrationFees = json['registration_fees'];
    eventStartTimings = DateTimeModel.fromJson(json['event_start_timings']);
    eventEndTimings = DateTimeModel.fromJson(json['event_end_timings']);
    if (json['participants_details'] != null) {
      participantsDetails = [];
      List<Map<String, dynamic>> list = json['participants_details'];
      for (var v in list) {
        participantsDetails.add(ParticipantsDetails.fromJson(v));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['uid'] = uid;
    data['event_images'] = eventImages;
    data['event_title'] = eventTitle;
    data['event_description'] = eventDescription;
    data['team_members'] = teamMembers;
    data['event_location'] = eventLocation.toJson();
    data['registration_fees'] = registrationFees;
    data['participants_details'] =
        participantsDetails.map((v) => v.toJson()).toList();
    data['event_start_timings'] = eventStartTimings.toJson();
    data['event_end_timings'] = eventEndTimings.toJson();

    return data;
  }
}

class EventLocation {
  late String address;
  late double lat;
  late double long;

  EventLocation({
    required this.address,
    required this.lat,
    required this.long,
  });

  EventLocation.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address'] = address;
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}

class ParticipantsDetails {
  late String id;
  late bool isEnabled;
  late String title;

  ParticipantsDetails({
    required this.id,
    required this.isEnabled,
    required this.title,
  });

  ParticipantsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isEnabled = json['is_enabled'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['is_enabled'] = isEnabled;
    data['title'] = title;
    return data;
  }
}
