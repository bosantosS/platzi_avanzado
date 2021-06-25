import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_avanzado/User/models/user.dart';
import 'package:platzi_avanzado/User/ui/widgets/button_bar.dart';
import 'package:platzi_avanzado/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {

  UserBloc userBloc;
  User user;
  
  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    return StreamBuilder<Object>(
      stream: userBloc.streamUserFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
            break;
          case ConnectionState.none:
            return CircularProgressIndicator();
            break;
          case ConnectionState.active:
            return showProfile(snapshot);
            break;
          case ConnectionState.done:
            return showProfile(snapshot);
            break;
          default: return Center(child: Text('Nothing to show...'),);
        }
        

      }
    );
  }

  Widget showProfile(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print('No loging');
      return Container(
          margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0
          ),
          child: Column(
            children: <Widget>[
              CircularProgressIndicator(),
              Text('Not loading data...'),
            ],
          ),
        );
    }else{

      print('Loging');
      print(snapshot.data);
      final userAu =User(
        email: snapshot.data.email,
        name: snapshot.data.displayName,
        photoURL: snapshot.data.photoURL, 
        uid: snapshot.data.uid, 
      );

      final title = Text(
      'Profile',
      style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0
      ),
    );

      return Container(
          margin: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  title,
                ],
              ),
              UserInfo(
                user: userAu,
              ),
              ButtonsBar()
            ],
          ),
        );
    }
  }

}