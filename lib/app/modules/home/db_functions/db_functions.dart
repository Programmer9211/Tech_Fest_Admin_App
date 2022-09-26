import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_admin_app/const/const.dart';

class HomeFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> getOrganiserEvents() async {
    try {
      final result = await _firestore
          .collection(AppKeys.events)
          .where(AppKeys.uid, isEqualTo: auth.currentUser!.uid)
          .get();
    } catch (e) {
      print(e);
    }
  }
}
