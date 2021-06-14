import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_catalog/Authentication/UserAuth.dart';
import 'package:project_catalog/Authentication/login_page.dart';
import 'package:project_catalog/Authentication/register_Page.dart';
import 'package:project_catalog/Screens/SplashScreen.dart';
import 'package:project_catalog/Screens/project_details.dart';
import 'package:project_catalog/Screens/test.dart';
import 'package:project_catalog/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/testPage": (context) => TestPage(),
        "/loginPage": (context) => UserAuth(),
        "/projectDetailPage": (context) => ProjectDetailPage(),
        "/registerPage": (context) => RegisterPage(),
      },
    );
  }
}
