import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModulGambar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Gambar by Komang Emo")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/Kirby.jpg'),
              Image.asset('images/Album.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
