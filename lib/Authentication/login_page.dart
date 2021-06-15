import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_catalog/Authentication/register_Page.dart';
import 'package:project_catalog/Screens/HomePage.dart';
import 'package:project_catalog/Screens/Home_Screen.dart';
import 'package:project_catalog/Screens/NavBar/NavBar.dart';
import 'package:project_catalog/services/auth.dart';
import 'package:project_catalog/services/helperFunction.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailEdittingController =
      new TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String name = "";
  bool changeButton = false;
  late QuerySnapshot snapshotUserInfo;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(
          emailEdittingController.text);
      setState(() {
        changeButton = true;
      });
    }
    await logInEmail(emailEdittingController.text, _pass.text);
    changeButton? Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => NavBar(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }),
        (route) => false) : CircularProgressIndicator();
  }

  moveToRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                RegisterPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }),
        (route) => false);
  }

  moveToHome2(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }),
        (route) => false);
  }

  moveToHomeGoogle(BuildContext context) {
    googleSign().then((user) {
      // ignore: unnecessary_null_comparison
      if (user != null) {
        return Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    NavBar(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(0.0, 1.0);
                  var end = Offset.zero;
                  var tween = Tween(begin: begin, end: end);
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                }),
            (route) => false);
      } else {
        return CircularProgressIndicator.adaptive();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        toolbarHeight: 40,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              moveToHome2(context);
            },
            child: Text("Later"),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Container(
                    child: Text(
                      "Welcome $name To",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Container(
                    child: Text(
                      "PROJECT CATALOG",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 65,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailEdittingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          hintText: "Enter a username",
                          labelText: "Username",
                          icon: Icon(CupertinoIcons.person_crop_circle),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter a username";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _pass,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          hintText: "Enter Password",
                          labelText: "Password",
                          icon: Icon(CupertinoIcons.lock_circle),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter Password";
                          } else if (value.length < 8) {
                            return "Please Enter Minimum Eight Characters Password";
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Colors.teal,
                                Theme.of(context).canvasColor
                              ],
                            ),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: () {
                              moveToHome(context);
                            }),
                      ),
                      TextButton(
                        child: Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {
                          moveToRegister(context);
                        },
                      ),
                      Divider(
                        color: Theme.of(context).accentColor,
                        height: 1,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SignInButton(
                        buttonType: ButtonType.google,
                        onPressed: () {
                          moveToHomeGoogle(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
