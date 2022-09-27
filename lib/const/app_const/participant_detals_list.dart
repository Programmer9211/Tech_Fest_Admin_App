import 'package:tech_fest_admin_app/const/app_const/app_keys.dart';

import '../../app/models/event_model.dart';

final List<ParticipantsDetails> participantsDetails = [
  ParticipantsDetails(
    id: AppKeys.name,
    title: "Participant's Name",
    isEnabled: true,
  ),
  ParticipantsDetails(
    id: AppKeys.phoneNumber,
    title: "Phone Number",
    isEnabled: true,
  ),
  ParticipantsDetails(
    id: AppKeys.instituteName,
    title: "Institution Name",
    isEnabled: true,
  ),
  ParticipantsDetails(
    id: AppKeys.registrationId,
    title: "Institution Id",
    isEnabled: true,
  ),
  ParticipantsDetails(
    id: AppKeys.githubIdLink,
    title: "Participant's Github Profile",
    isEnabled: true,
  ),
  ParticipantsDetails(
    id: AppKeys.instagramIdLink,
    title: "Participant's Instagram Link",
    isEnabled: true,
  ),
  ParticipantsDetails(
    id: AppKeys.linkdinIdLink,
    title: "Participant's Linkdin Link",
    isEnabled: true,
  ),
  ParticipantsDetails(
    id: AppKeys.twitterIdLink,
    title: "Participant's Twitter",
    isEnabled: true,
  ),
];
