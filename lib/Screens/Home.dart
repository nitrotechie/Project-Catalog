import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.all(16.0),
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
              Container(
                child: GestureDetector(
                  onTap: () {
                    print("Card");
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/flutter.png",
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  print("Read More is pressed");
                                },
                                child: Text(
                                  "Read More",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Colors.white,
                                      onPressed: () {
                                        print("SnackBar Ok is pressed");
                                      },
                                    ),
                                  );
        
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Text(
                                  "Add to Favorite",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    print("Card");
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/flutter.png",
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  print("Read More is pressed");
                                },
                                child: Text(
                                  "Read More",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Colors.white,
                                      onPressed: () {
                                        print("SnackBar Ok is pressed");
                                      },
                                    ),
                                  );
        
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Text(
                                  "Add to Favorite",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    print("Card");
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/images/flutter.png",
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            child: Text(
                              "Project Catalog",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          Container(
                            child: Text(
                              "This App is useful for CSE students to view different project ideas and and also students can share his/her ideas with others students via app.",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  print("Read More is pressed");
                                },
                                child: Text(
                                  "Read More",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content: Text(
                                        "This Function is in beta test is not working yet."),
                                    action: SnackBarAction(
                                      label: "Ok",
                                      textColor: Colors.white,
                                      onPressed: () {
                                        print("SnackBar Ok is pressed");
                                      },
                                    ),
                                  );
        
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Text(
                                  "Add to Favorite",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
