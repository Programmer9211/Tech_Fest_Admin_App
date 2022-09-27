import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';
import 'package:tech_fest_admin_app/app/models/event_model.dart';
import 'package:tech_fest_admin_app/const/app_const/app_keys.dart';

class CreateEventFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> createEventDetails(EventModel model) async {
    try {
      await _firestore
          .collection(AppKeys.events)
          .doc(model.id)
          .set(model.toJson());
    } catch (e) {
      Indicator.showSnackBar("Something went wrong");
      print(e);
    }
  }
}
