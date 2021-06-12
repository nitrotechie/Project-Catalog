import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_catalog/Screens/document.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  moveToProjectDetail(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Document(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/flutter.png"),
                  fit: BoxFit.cover,
                  scale: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "Project Management System",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Ankit Singh",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
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
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Text(
              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                moveToProjectDetail(context);
              },
              child: Text("Read Complete Document"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).buttonColor,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
