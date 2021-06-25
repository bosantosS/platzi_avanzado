import 'dart:io';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_avanzado/Place/ui/pages/add_place_page.dart';
import 'package:platzi_avanzado/User/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
            // TODO: Change password
            CircleButton(
              true, 
              Icons.vpn_key, 
              20.0, 
              Color.fromRGBO(255, 255, 255, 0.6),
              () {

              }
            ),
            // TODO: Load a new place
            CircleButton(
              false, 
              Icons.add, 
              40.0, 
              Color.fromRGBO(255, 255, 255, 1),
              () {
                
                final _picker = ImagePicker();
                _picker.getImage(
                  source: ImageSource.camera
                ).then((PickedFile image) {
                  if(image !=null){
                    final fileImg = File(image.path);
                    print('FIMG ${fileImg}');
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddPlacePage(
                        img: fileImg,
                      )
                    )
                  );
                  }else {
                    print('IS IMG NULL');
                  }
                  
              }).catchError((onError) => print(onError));

              }
            ),
            // Sign Out
            CircleButton(
              true, 
              Icons.exit_to_app, 
              20.0, 
              Color.fromRGBO(255, 255, 255, 0.6),
              () {
                userBloc.signOut();
              }
            ),
            
          ],
        )
    );
  }

}