import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View Count by Komang Emo"),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return Container(child: Card(color: Colors.deepPurpleAccent));
          }),
        ),
      ),
    );
  }
}
