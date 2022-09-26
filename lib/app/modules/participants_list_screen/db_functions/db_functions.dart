import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_fest_admin_app/app/models/user_model.dart';
import 'package:tech_fest_admin_app/const/app_const/app_keys.dart';

class ParticipantsListFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<UserModel>?> getParticipantsList(String id) async {
    try {
      final result = await _firestore
          .collection(AppKeys.events)
          .doc(id)
          .collection(AppKeys.participantList)
          .get();

      List<UserModel> model =
          result.docs.map((e) => UserModel.fromJson(e.data())).toList();

      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
