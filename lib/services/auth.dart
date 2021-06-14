import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_catalog/Authentication/login_page.dart';
import 'package:project_catalog/model/user.dart';

Future<User> createAccountEmail(
    String name, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Account created Succesfull");

      // ignore: deprecated_member_use
      user.updateProfile(displayName: name);

      await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
        "name": name,
        "email": email,
        "status": "Unavalible",
        "uid": _auth.currentUser!.uid,
      });

      return user;
    } else {
      print("Account creation failed");
      return user!;
    }
  } catch (e) {
    print(e);
    return null!;
  }
}

Future<User> logInEmail(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      print("Login Sucessfull");
      _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get()
          // ignore: deprecated_member_use
          .then((value) => user.updateProfile(displayName: value['name']));
      return user;
    } else {
      print("Login Failed");
      return user!;
    }
  } catch (e) {
    print(e);
    return null!;
  }
}

Future<User> googleSign() async {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _googleSignInAccount = await _googleSignIn.signIn();

  var _authentication = await _googleSignInAccount!.authentication;
  var _credential = GoogleAuthProvider.credential(
    idToken: _authentication.idToken,
    accessToken: _authentication.accessToken,
  );

  User? user = (await _auth.signInWithCredential(_credential)).user;
  return user!;
}

Future logOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
    });
  } catch (e) {
    print("error");
  }
}
