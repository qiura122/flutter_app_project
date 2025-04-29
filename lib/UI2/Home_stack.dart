import 'package:flutter/material.dart';

class Home_stack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purpleAccent),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: Colors.deepPurpleAccent, height: 600, width: 400),
          Container(color: Colors.indigoAccent, height: 500, width: 300),
          Container(color: Colors.deepOrangeAccent, height: 400, width: 200),
          Container(color: Colors.redAccent, height: 300, width: 100),
        ],
      ),
      backgroundColor: Colors.teal,
    );
  }
}
