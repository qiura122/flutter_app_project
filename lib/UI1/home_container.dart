import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: Colors.deepPurpleAccent),
      body: Container(
        height: 200,
        width: 500,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 2),
        ),
        alignment: Alignment.center,
        child: Text(
          'I Komang Emo Wijaya Kusuma',
          style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
