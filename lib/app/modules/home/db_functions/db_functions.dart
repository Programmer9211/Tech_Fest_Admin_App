import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_admin_app/app/models/event_model.dart';
import 'package:tech_fest_admin_app/const/const.dart';

class HomeFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<List<EventModel>?> getOrganiserEvents() async {
    try {
      final result = await _firestore
          .collection(AppKeys.events)
          .where(AppKeys.uid, isEqualTo: auth.currentUser!.uid)
          .get();

      List<EventModel> eventModel =
          result.docs.map((e) => EventModel.fromJson(e.data())).toList();

      return eventModel;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
