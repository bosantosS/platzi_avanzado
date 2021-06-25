import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuthCredential = await googleSignInAccount.authentication;
    UserCredential user = await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
        idToken:googleAuthCredential.idToken,
        accessToken:googleAuthCredential.accessToken,
      )
    );
    return user;
  }

  signOut() async {
    
    await _auth.signOut().then(
      (value) => print('Session Firebase close')
    ).catchError(
      (onError) => print(onError)
    );

    await googleSignIn.signOut().then(
      (value) => print('Session Google close $value')
      ).catchError(
        (onError)=>print(onError)
      );
    
  }
}