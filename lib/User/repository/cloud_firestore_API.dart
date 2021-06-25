import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as AUTH;
import 'package:platzi_avanzado/Place/models/place.dart';
import 'package:platzi_avanzado/User/models/user.dart' as modUser;

class CloudFirestoreAPI {
  final String USERS = 'users';
  final String PLACES = 'places';

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AUTH.FirebaseAuth _auth = AUTH.FirebaseAuth.instance;

  void updateUserData(modUser.User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritesPlaces': user.myFavoritesPlaces,
      'lastSignIn': DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    // Consultar quien esta logueado
    AUTH.User userFB = _auth.currentUser;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': "${USERS}/${userFB.uid}", // references
      'urlImg':place.urlImg,
    });
  }
}
