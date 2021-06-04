import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/Home.dart';
import 'package:project_catalog/Screens/add_project.dart';
import 'package:project_catalog/Screens/favorite.dart';
import 'package:project_catalog/Screens/login_page.dart';
import 'package:project_catalog/Screens/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.add),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
        ),
      ]),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: Home(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: SearchPage(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: AddProjectPage(),
              );
            });
            break;
            case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: FavoritePage(),
              );
            });
            break;
          case 4:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: LoginPage(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
