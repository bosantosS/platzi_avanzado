import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_avanzado/User/bloc/bloc_user.dart';
import 'package:platzi_avanzado/platzi_trips_cupertino.dart';
import 'package:platzi_avanzado/widgets/button_green.dart';
import 'package:platzi_avanzado/widgets/gradient_back.dart';

import 'package:platzi_avanzado/User/models/user.dart' as modUser;

class SignInPage extends StatefulWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  double screenWidth;

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    // Instanciar el userBloc, desde el generico
    userBloc = BlocProvider.of(context);
    screenWidth = MediaQuery.of(context).size.width;

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(!snapshot.hasData || snapshot.hasError ){
          return signInGoogleUI();
        }else {
          return PlatziTripsCupertino();
        }
        
      }
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            title: '',
            height:null
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWidth,
                  child: Text(
                    'Welcome \n This is your travel app',
                    style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ButtonGreen(
                text: 'Login with gmail', 
                onPressed: (){
                  userBloc.signOut();
                  userBloc.signIn().then(
                    (value) {
                      print('User: ${value.user.displayName}');
                      userBloc.updateUserDataCloudFirestore(
                        modUser.User(
                          uid:value.user.uid,
                          email: value.user.email,
                          name: value.user.displayName,
                          photoURL: value.user.photoURL,
                        )
                      );
                    }
                  ).catchError((error)=>print('ERROR> $error'));
                }, 
                width: 300.00, 
                height: 50.00,
              )
            ],
          )
        ]
      ),
    );
  }
}