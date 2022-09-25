import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tech_fest_admin_app/app/models/coordinator_model.dart';

import '../../../../const/const.dart';
import '../../../data/get_storage/get_storage.dart';

class SignupFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> saveUserDetails(CoordinatorModel userModel) async {
    print(userModel.toJson());

    await _firestore
        .collection(AppKeys.users)
        .doc(userModel.uid)
        .set(userModel.toJson());

    await Storage.saveValue(AppKeys.uid, userModel.uid);
    await Storage.saveValue(AppKeys.email, userModel.email);
    await Storage.saveValue(AppKeys.name, userModel.name);
  }
}
