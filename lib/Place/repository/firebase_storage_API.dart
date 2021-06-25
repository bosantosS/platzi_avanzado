import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  final Reference _storageRef= FirebaseStorage.instance.ref();

  // UploadTask uploadFile(String path,  File fileImg) {
  //   final metadata = SettableMetadata(
  //       contentType: 'image/jpeg',
  //       customMetadata: {'picked-file-path': path});
  //   return _storageRef.child(path).putFile(fileImg,metadata);
    
  // }

  // Future<TaskSnapshot> uploadFile(String path, File image) async {

  //   TaskSnapshot uploadTask = await _storageRef.child(path).putFile(image);
  //   //TaskSnapshot taskSnapshot =  await uploadTask.whenComplete(() => null);

  //   return uploadTask;
    
  // }

  Future<TaskSnapshot> uploadFile(String path, File image) async {
    final metadata = SettableMetadata(
         contentType: 'image/jpeg',
         customMetadata: {'picked-file-path': path});
    UploadTask uploadTask = _storageRef.child(path).putFile(image,metadata);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    return taskSnapshot;
    
  }

  // Future<TaskSnapshot> uploadFileFireStorage(String path, File fileImg) async {
  //   return await _storageRef.child(path).putFile(fileImg);
  // }
}