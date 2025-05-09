import 'package:flutter/material.dart';

class Home_row extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purpleAccent),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('I Komang Emo Wijaya Kusuma', style: TextStyle(fontSize: 20)),
            Text('NIM: 2315354082', style: TextStyle(fontSize: 20)),
            Text('Kelas: 4B', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
