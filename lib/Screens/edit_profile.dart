import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/profile_page.dart';
import 'package:project_catalog/Screens/settings.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _profession = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _website = new TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  bool _isloading = false;

  moveToProfile(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProfilePage(),
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

  moveToProfileDone(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
    }
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProfilePage(),
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

  _showDialog() {
    if (_formKey.currentContext != null) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              title: Text("Unsaved changes"),
              content: Text(
                  "You have unsaved changes. Are you sure you want to cancel!?"),
              actions: [
                TextButton(
                  onPressed: () {
                    moveToProfileDone(context);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            size: 32,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            _showDialog();
          },
        ),
        title: Text("Edit Profile"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              size: 32,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              Navigator.of(context).pop(ProfilePage());
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 5, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
//profile image section
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage("assets/images/user_default_pic.png"),
                        ),
                      ),
                    ),
                    //edit icon section
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.grey.shade700,
                          ),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 23,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//edit profile info section
              SizedBox(height: 25),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      hintText: "Enter a Name",
                      labelText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _profession,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    hintText: "Enter Profession",
                    labelText: "Profession"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Profession";
                  } else {
                    return null;
                  }
                },
              ),
              //email address
              SizedBox(height: 25),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    hintText: "Enter your E-mail Address",
                    labelText: "E-mail Address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your E-mail Address";
                  } else {
                    return null;
                  }
                },
              ),
//website url
              SizedBox(height: 25),
              TextFormField(
                controller: _website,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    hintText: "Website URL",
                    labelText: "Website"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
