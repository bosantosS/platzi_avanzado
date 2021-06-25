import 'package:flutter/cupertino.dart';
import 'package:platzi_avanzado/User/models/user.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImg;
  int likes;

  User userOwner;

  Place({
    @required this.name,
    @required this.description,
    @required this.urlImg,
    @required this.userOwner,
    this.likes,
  });
}