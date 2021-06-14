import 'package:flutter/material.dart';
import 'package:project_catalog/Screens/SearchPost.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).canvasColor,
              elevation: 0,
              toolbarHeight: 50,
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: "Post",
                  ),
                  Tab(
                    text: "User",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SearchPost(),
                Container(),
              ],
            )),
      ),
    );
  }
}
