import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/project_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              backgroundColor: Theme.of(context).canvasColor,
              elevation: 0,
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                title: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "   Project",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                  ),
                  TextSpan(
                    text: "Catalog",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  )
                ])),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            moveToProjectDetail(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                                        backgroundImage: AssetImage(
                                            "assets/images/profile.jpg"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Ankit Singh",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Theme.of(context)
                                                  .accentColor),
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Theme.of(context)
                                                        .buttonColor),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)))),
                                        onPressed: () {
                                          final snackBar = SnackBar(
                                            content: Text(
                                                "This Function is in beta test is not working yet."),
                                            action: SnackBarAction(
                                              label: "Ok",
                                              textColor:
                                                  Theme.of(context).canvasColor,
                                              onPressed: () {
                                                print(
                                                    "Follow SnackBar Ok is pressed");
                                              },
                                            ),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        icon: Icon(
                                            CupertinoIcons.add_circled_solid),
                                        label: Text("Follow"),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
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
                                                textColor: Theme.of(context)
                                                    .canvasColor,
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
                                                textColor: Theme.of(context)
                                                    .canvasColor,
                                                onPressed: () {
                                                  print(
                                                      "Share SnackBar Ok is pressed");
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
                  );
                },
                childCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
