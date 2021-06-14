import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:project_catalog/Screens/edit_profile.dart';
// import 'package:project_catalog/Screens/settings.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const double fabHeightCLosed = 300.0;
  double fabHeight = fabHeightCLosed;
  bool _isOpen = false;
  PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isOpen ? Colors.grey[700] : Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 32,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              // Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/profile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(color: Theme.of(context).canvasColor),
          ),

          //<<<<<<<<<<<<<Sliding Panel>>>>>>>>>>>>
          SlidingUpPanel(
            backdropEnabled: true,
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.36,
            maxHeight: MediaQuery.of(context).size.height * 0.90,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  //<<<<<<<<<<<<<<<<Panel Body >>>>>>>>>>>>>>>>>>>>>
  Container _panelBody(ScrollController controller) {
    double hPadding = 40;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            topLeft: Radius.circular(32),
          ),
          color: Theme.of(context).canvasColor),
      child: SingleChildScrollView(
        controller: controller,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildDraghandle(),
                  _titleSection(),
                  _infoSection(),
                  _actionSection(hPadding: hPadding),
                ],
              ),
            ),

            //adding list view //
          ],
        ),
      ),
    );
  }

  ///<<<<<<<<<<<<<<<<<<<<<< Action Section>>>>>>>>>>>>>>>>>>>>
  Row _actionSection({required double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlineButton(
              onPressed: () => _panelController.open(),
              borderSide: BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'VIEW PROFILE',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isOpen,
          child: SizedBox(
            width: 16,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: _isOpen
                  ? (MediaQuery.of(context).size.width - (2 * hPadding)) / 1.6
                  : double.infinity,
              child: FlatButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => EditProfilePage()));
                },
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// <<<<<<<<<<<<<<<<<<<<<<<Info Section>>>>>>>>>>>>>>>>>>>
  Row _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _infoCell(title: 'Projects', value: '10'),
        Container(
          width: 1.1,
          height: 40,
          color: Theme.of(context).accentColor,
        ),
        _infoCell(
          title: 'Followers',
          value: "20",
        ),
        Container(
          width: 1.1,
          height: 40,
          color: Theme.of(context).accentColor,
        ),
        _infoCell(title: 'Following', value: '30'),
      ],
    );
  }

  /// <<<<<<<<<<<<<<<<<<<<Info Cell>>>>>>>>>>>>>>>>>>>>>
  Column _infoCell({required String title, required String value}) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// <<<<<<<<<<<<<<<<<<<<<Title Section>>>>>>>>>>>>>>>>>>>>>>>>>
  Widget _titleSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 2),
      child: Column(
        children: <Widget>[
          Text(
            'Yadav Amarnath',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Student',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),

// website url section
          Text(
            'www.gtihub.com',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

//slipanl handler section
  Widget buildDraghandle() => Center(
        child: Container(
          width: 60,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.white60,
          ),
        ),
      );
}
