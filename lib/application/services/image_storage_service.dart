import 'dart:io';

import 'package:snapkart_app/application/brokers/firebase_storage_broker.dart';

class ImageStorageService {
  var firebaseStorage = FirebaseStorageBroker();

  Future<String> uploadImage(File file) async {
    var url = await firebaseStorage.uploadFile(file);
    return url;
  }
}
