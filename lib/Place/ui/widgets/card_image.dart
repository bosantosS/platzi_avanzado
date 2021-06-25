import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_avanzado/widgets/floating_action_button_green.dart';


class  CardImageWithFABIcon extends StatelessWidget {

  double height = 350.0;
  double width = 250.0;
  double left = 20.0;
  final String pathImage;
  final VoidCallback onPressedFABIcon;
  final IconData icon;

  CardImageWithFABIcon({
    Key key, 
    @required this.pathImage,
    @required this.width,
    @required this.height,
    @required  this.onPressedFABIcon, 
    @required this.icon,
    this.left,
  });

  @override
  Widget build(BuildContext context) {

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        left: this.left
      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: pathImage.contains('assets') 
              ? AssetImage(pathImage) 
              : FileImage(new File(pathImage)),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          icon: icon, 
          onPressed: onPressedFABIcon,)
      ],
    );
  }

}