import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/profile_page.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Edit Profile",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _profession = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _website = new TextEditingController();

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
            if (_name.text != null &&
                _profession.text != null &&
                _email.text != null &&
                _website.text != null) {
              createAlertDialog(BuildContext context) {
                TextEditingController customController =
                    TextEditingController();
                    return showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("Unsaved changes"),
                        content: Text("You have unsaved changes. Are you sure you want to cancel!?"),
                        // controller: customController,
                        actions: <Widget>[
                          MaterialButton(
                            elevation: 5.0,
                            child: Text("Yes cancel!"),
                            onPressed: () {},
                            

                          )
                        ],
                      );
                    });
              }
            } else {
              Navigator.of(context).pop(ProfilePage());
            }
          },
        ),
        title: Text("Edit Profile                                          "),
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
              TextFormField(
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
