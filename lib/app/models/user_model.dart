import '../../const/const.dart';

class UserModel {
  late String uid;
  late String phoneNumber;
  late String name;
  late String profileImage;
  late String instituteName;
  late String registrationId;
  late String email;
  late int eventAttended;
  late bool isProfileComplete;

  UserModel({
    required this.uid,
    required this.phoneNumber,
    required this.name,
    required this.instituteName,
    required this.registrationId,
    required this.profileImage,
    required this.eventAttended,
    required this.email,
    required this.isProfileComplete,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json[AppKeys.uid];
    phoneNumber = json[AppKeys.phoneNumber];
    name = json[AppKeys.name];
    eventAttended = json[AppKeys.eventAttended];
    instituteName = json[AppKeys.instituteName];
    registrationId = json[AppKeys.registrationId];
    profileImage = json[AppKeys.profileImage];
    email = json[AppKeys.email];
    isProfileComplete = json[AppKeys.isProfileComplete];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data[AppKeys.uid] = uid;
    data[AppKeys.phoneNumber] = phoneNumber;
    data[AppKeys.name] = name;
    data[AppKeys.instituteName] = instituteName;
    data[AppKeys.registrationId] = registrationId;
    data[AppKeys.profileImage] = profileImage;
    data[AppKeys.email] = email;
    data[AppKeys.eventAttended] = eventAttended;
    data[AppKeys.isProfileComplete] = isProfileComplete;
    return data;
  }
}
