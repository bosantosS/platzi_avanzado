import 'package:flutter/material.dart';
import 'package:platzi_avanzado/Place/models/place.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String photoURL;

  final List<Place> myPlaces;
  final List<Place> myFavoritesPlaces;
  //myFavoritesPlaces
  //myPlaces

  User({
    @required this.uid,
    @required this.name, 
    @required this.email, 
    @required this.photoURL,
    this.myPlaces, this.myFavoritesPlaces,
  } );


}