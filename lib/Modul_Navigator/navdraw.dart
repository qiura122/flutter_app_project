import 'package:flutter/material.dart';

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

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
            icon: Icons.folder,
            text: 'My Files',
            onTap: () => print("Tap My Files"),
          ),
          _drawerItem(
            icon: Icons.group,
            text: 'Shared',
            onTap: () => print("Tap Shared"),
          ),
          _drawerItem(
            icon: Icons.access_time,
            text: 'Recent',
            onTap: () => print("Tap Recent"),
          ),
          _drawerItem(
            icon: Icons.delete,
            text: 'Trash',
            onTap: () => print("Tap Trash"),
          ),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text(
              'Labels',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          _drawerItem(
            icon: Icons.bookmark,
            text: 'Bookmarks',
            onTap: () => print("Tap Bookmarks"),
          ),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
        image: AssetImage('images/User1.png'),
        fit: BoxFit.cover,
      ),
    ),
    otherAccountsPictures: [
      ClipOval(
        child: Image(
          image: AssetImage('images/User2.png'),
          fit: BoxFit.cover,
        ),
      ),
      ClipOval(
        child: Image(
          image: AssetImage('images/User2.png'),
          fit: BoxFit.cover,
        ),
      ),
    ],
    accountName: Text('Komang Emo'),
    accountEmail: Text('komangemo@gmail.com'),
  );
}

Widget _drawerItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    ),
    onTap: onTap,
  );
}

