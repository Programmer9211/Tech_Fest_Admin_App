import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_admin_app/app/models/coordinator_model.dart';

import '../../../../const/const.dart';

class ProfileFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<CoordinatorModel?> getUserProfileDetail() async {
    try {
      final result = await _firestore
          .collection(AppKeys.organisers)
          .doc(_auth.currentUser!.uid)
          .get();

      CoordinatorModel model = CoordinatorModel.fromJson(result.data()!);

      return model;
    } catch (e) {
      print(e);

      return null;
    }
  }
}
