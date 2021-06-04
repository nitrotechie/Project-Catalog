import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/HomePage.dart';
import 'package:project_catalog/Screens/project_details.dart';
import 'package:project_catalog/Screens/test.dart';
import 'package:project_catalog/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/projectDetailPage",
      routes: {
        "/": (context) => HomePage(),
        "/testPage": (context) => TestPage(),
        "/projectDetailPage": (context) => ProjectDetailPage(),
      },
    );
  }
}
