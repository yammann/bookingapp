import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';


imgStorgeAndGetUrl({required String imgName,required Uint8List imgPaht,required String foldername})async{
  try {
  final storgref = FirebaseStorage.instance.ref("$foldername/$imgName");
      UploadTask uplodTask = storgref.putData(imgPaht);
      TaskSnapshot snap = await uplodTask;
      String url = await snap.ref.getDownloadURL();
  
      return url;
} on Exception catch (e) {
  print(e);
}
}