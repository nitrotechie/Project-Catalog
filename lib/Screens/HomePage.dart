// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:project_catalog/Authentication/UserAuth.dart';
// import 'package:project_catalog/Screens/Home_Screen.dart';
// import 'package:project_catalog/Screens/add_project.dart';
// import 'package:project_catalog/Screens/favorite.dart';
// import 'package:project_catalog/Screens/search.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);

//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   int _selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: "Search",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: "Add",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark),
//             label: "Bookmarks",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//       tabBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: HomeScreen(),
//                 );
//               },
//             );
//           case 1:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: SearchPage(),
//                 );
//               },
//             );
//           case 2:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: AddProjectPage(),
//                 );
//               },
//             );
//           case 3:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: FavoritePage(),
//                 );
//               },
//             );
//           case 4:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: UserAuth(),
//                 );
//               },
//             );
//           default:
//             return CupertinoTabView(
//               builder: (context) {
//                 return CupertinoPageScaffold(
//                   child: HomeScreen(),
//                 );
//               },
//             );
//         }
//       },
//     );
//   }
// }
