import 'dart:io';

import 'package:snapkart_app/application/brokers/firebase_storage_broker.dart';
import 'package:snapkart_app/application/dto/result.dart';

class ImageStorageService {
  var firebaseStorage = FirebaseStorageBroker();

  Future<Result<String>> uploadImage(File file) async {
    try {
      var url = await firebaseStorage.uploadFile(file);
      return Result.ok<String>(url);
    }catch(error){
      var message = error.toString();
      return Result.error("failed to upload image", 500);
    }
  }
}
