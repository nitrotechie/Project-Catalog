import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/Home.dart';
import 'package:project_catalog/Screens/HomePage.dart';
import 'package:project_catalog/Screens/login_page.dart';
import 'package:project_catalog/Screens/register_Page.dart';
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
      initialRoute: "/homePage",
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => Home(),
        "/homePage": (context) => HomePage(),
        "/testPage": (context) => TestPage(),
        "/registerPage": (context) => RegisterPage(),
      },
    );
  }
}
