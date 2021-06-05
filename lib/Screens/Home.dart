import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/project_details.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  moveToProjectDetail(BuildContext context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProjectDetailPage(),
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
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Container(
                  child: Text(
                    "PROJECT CATALOG",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  moveToProjectDetail(context);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                            Container(
                              child: Text(
                                "Ankit Singh",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).buttonColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text(
                                      "This Function is in beta test is not working yet."),
                                  action: SnackBarAction(
                                    label: "Ok",
                                    textColor: Theme.of(context).canvasColor,
                                    onPressed: () {
                                      print("Follow SnackBar Ok is pressed");
                                    },
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(CupertinoIcons.add_circled_solid),
                              label: Text("Follow"),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/flutter.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print(
                                            "Bookmark SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.bookmark)),
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print("Share SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.share)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Card is Pressed");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Text(
                                "Ankit Singh",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).buttonColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text(
                                      "This Function is in beta test is not working yet."),
                                  action: SnackBarAction(
                                    label: "Ok",
                                    textColor: Theme.of(context).canvasColor,
                                    onPressed: () {
                                      print("Follow SnackBar Ok is pressed");
                                    },
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(CupertinoIcons.add_circled_solid),
                              label: Text("Follow"),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/flutter.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print(
                                            "Bookmark SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.bookmark)),
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print("Share SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.share)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Card is Pressed");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Text(
                                "Ankit Singh",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).buttonColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text(
                                      "This Function is in beta test is not working yet."),
                                  action: SnackBarAction(
                                    label: "Ok",
                                    textColor: Theme.of(context).canvasColor,
                                    onPressed: () {
                                      print("Follow SnackBar Ok is pressed");
                                    },
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(CupertinoIcons.add_circled_solid),
                              label: Text("Follow"),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/flutter.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print(
                                            "Bookmark SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.bookmark)),
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print("Share SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.share)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Card is Pressed");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Text(
                                "Ankit Singh",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).buttonColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text(
                                      "This Function is in beta test is not working yet."),
                                  action: SnackBarAction(
                                    label: "Ok",
                                    textColor: Theme.of(context).canvasColor,
                                    onPressed: () {
                                      print("Follow SnackBar Ok is pressed");
                                    },
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(CupertinoIcons.add_circled_solid),
                              label: Text("Follow"),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/flutter.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print(
                                            "Bookmark SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.bookmark)),
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print("Share SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.share)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Card is Pressed");
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              child: Text(
                                "Ankit Singh",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).buttonColor),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              onPressed: () {
                                final snackBar = SnackBar(
                                  content: Text(
                                      "This Function is in beta test is not working yet."),
                                  action: SnackBarAction(
                                    label: "Ok",
                                    textColor: Theme.of(context).canvasColor,
                                    onPressed: () {
                                      print("Follow SnackBar Ok is pressed");
                                    },
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(CupertinoIcons.add_circled_solid),
                              label: Text("Follow"),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/images/flutter.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print(
                                            "Bookmark SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.bookmark)),
                            IconButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Theme.of(context).canvasColor,
                                      onPressed: () {
                                        print("Share SnackBar Ok is pressed");
                                      },
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(CupertinoIcons.share)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
