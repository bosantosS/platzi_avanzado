import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:platzi_avanzado/Place/repository/firebase_storage_API.dart';

class FirebaseStorageRepository {

  final _firebaseStorageAPI = FirebaseStorageAPI();

  Future<TaskSnapshot> uploadFile(String path,  File fileImg) async => _firebaseStorageAPI.uploadFile(path, fileImg); 
}