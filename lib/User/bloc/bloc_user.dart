import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_avanzado/Place/models/place.dart';
import 'package:platzi_avanzado/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_avanzado/User/repository/auth_repository.dart';
import 'package:platzi_avanzado/User/repository/cloud_firestore_repository.dart';

import 'package:platzi_avanzado/User/models/user.dart' as modUser;

// Casos de uso (CU)
class UserBloc implements Bloc {

  final _authRepo = AuthRepository();

  Stream<User> streamUserFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamUserFirebase;
  User get currentUser => FirebaseAuth.instance.currentUser;
  
  final _cloudFirestoreRepo = CloudFirestoreRepository();

  final _firebaseStoreRepo = FirebaseStorageRepository();

  // CU1. Sign in con google
  Future<UserCredential> signIn() {
    return _authRepo.signInFirebase();
  }
  
  // CU2. Sign out Google/Firebase
  signOut() {
    _authRepo.signOut();
    
  }

  // CU3. Registrar usuarios
  void updateUserDataCloudFirestore(modUser.User user) => _cloudFirestoreRepo.updateUserDataCloudFirestore(user); 
  @override
  void dispose() {
    // TODO: implement dispose
  }

  //CU4. Update place
  Future<void> updatePlaceDataCloudFirestore(Place place) => _cloudFirestoreRepo.updatePlaceData(place);

  // CU5. Upload place's photo
  Future<TaskSnapshot> uploadFile(String path,  File fileImg) async => _firebaseStoreRepo.uploadFile(path, fileImg);
}