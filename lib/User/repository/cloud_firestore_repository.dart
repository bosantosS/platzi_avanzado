import 'package:platzi_avanzado/Place/models/place.dart';
import 'package:platzi_avanzado/User/models/user.dart';
import 'package:platzi_avanzado/User/repository/cloud_firestore_API.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataCloudFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
}