import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseStorageBroker {
  FirebaseStorage storage = FirebaseStorage.instance;

  uploadFile(File file) async {
    if (file == null) {
      return null;
    }

    var fileName = DateTime.now().toIso8601String() + '.jpeg';

    Reference ref = storage.ref().child('images').child(fileName);

    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    await ref.putFile(File(file.path), metadata);

    String returnUrl;
    await ref.getDownloadURL().then((fileURL) {
      returnUrl = fileURL;
    });
    return returnUrl;
  }
}
