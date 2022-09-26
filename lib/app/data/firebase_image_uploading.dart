import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:tech_fest_admin_app/app/data/generate_id.dart';
import 'package:tech_fest_admin_app/app/data/indicator.dart';

class FirebaseFileUploading {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Future<String?> uploadImage(File imageFile) async {
    try {
      final ref = _storage.ref().child("Images").child("${generateId()}.jpg");
      var uploadTask = await ref.putFile(imageFile);

      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      Indicator.showSnackBar("Something went wrong");
      print(e);
      return null;
    }
  }
}
