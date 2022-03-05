import 'package:chess_app/model/pojo/user.dart';
import 'package:chess_app/model/services/store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final Store _store = Store();

  Future<UserCredential> createUser(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> login(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<bool> logout() async {
    try {
      _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential credential = await _firebaseAuth.signInWithCredential(authCredential);

    final User? user = credential.user;

    // Her to check isNewUser OR Not
    if (credential.additionalUserInfo!.isNewUser) {
      if (user != null) {
        //You can her set data user in Fire store
        _store.saveUser(AppUser(id: user.uid, email: user.email!, image: user.photoURL, name: user.displayName));
      }
    }
    return credential;
  }

  Future<UserCredential> loginWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final UserCredential credential = await _firebaseAuth.signInWithCredential(facebookAuthCredential);

    final User? user = credential.user;

    // Her to check isNewUser OR Not
    if (credential.additionalUserInfo!.isNewUser) {
      if (user != null) {
        //You can her set data user in Fire store
        _store.saveUser(AppUser(id: user.uid, email: user.email!, image: user.photoURL, name: user.displayName));
      }
    }
    return credential;
  }
}
