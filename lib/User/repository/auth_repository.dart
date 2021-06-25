import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_avanzado/User/repository/firebase_auth_API.dart';

// Logica de negocio para conectar con Firebase
class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<UserCredential> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();
}

