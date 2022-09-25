import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tech_fest_admin_app/app/models/coordinator_model.dart';

import '../../../../const/app_const/app_keys.dart';
import '../../../data/get_storage/get_storage.dart';

class SigninFunction {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> getData() async {
    final result = await _firestore
        .collection(AppKeys.users)
        .doc(_auth.currentUser!.uid)
        .get();

    CoordinatorModel userModel = CoordinatorModel.fromJson(result.data()!);

    await Storage.saveValue(AppKeys.uid, userModel.uid);
    await Storage.saveValue(AppKeys.email, userModel.email);
    await Storage.saveValue(AppKeys.name, userModel.name);
  }
}
