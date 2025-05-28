import 'package:flutter/material.dart';
import 'package:flutter_app_project/Modul_Navigator/drawer_widget.dart';

class Navdraw extends StatefulWidget {
  @override
  _NavdrawState createState() => _NavdrawState();
}

class _NavdrawState extends State<Navdraw> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.account_circle),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        title: Text('Navigation Drawer'),
        backgroundColor: Colors.deepOrangeAccent,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.account_box, color: Colors.white),
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      endDrawer: DrawerWidget(),
      body: Center(
        child: Text(
          'Navigation Drawer Example',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
