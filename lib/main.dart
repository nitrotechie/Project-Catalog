import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/HomePage.dart';
import 'package:project_catalog/Authentication/login_page.dart';
import 'package:project_catalog/Screens/project_details.dart';
import 'package:project_catalog/Screens/test.dart';
import 'package:project_catalog/utils/themes.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseAuth.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
      routes: {
        "/": (context) => NavBar(),
        "/testPage": (context) => TestPage(),
        "/loginPage": (context) => LoginPage(),
        "/projectDetailPage": (context) => ProjectDetailPage(),
      },
    );
  }
}
