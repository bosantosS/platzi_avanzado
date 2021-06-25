import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double width = 300.0;
    double height = 350.0;
    double left = 20.0;

    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFABIcon(
            pathImage: "assets/img/beach_palm.jpeg", 
            icon: Icons.favorite_border, 
            height: height, width: width , left: left,
            onPressedFABIcon: () {  },
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/mountain_stars.jpeg", 
            icon: Icons.favorite_border,
            height: height, width: width , left: left,
            onPressedFABIcon: () {  },
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/river.jpeg", 
            icon: Icons.favorite_border,
            height: height, width: width , left: left,
            onPressedFABIcon: () {  },
          ),
          CardImageWithFABIcon(
            pathImage: "assets/img/sunset.jpeg", 
            icon: Icons.favorite_border,
            height: height, width: width , left: left,
            onPressedFABIcon: () {  },
          ),
        ],
      ),
    );
  }

}