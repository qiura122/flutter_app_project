import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        leading: const Icon(Icons.menu),
        titleSpacing: 0,
        title: const Text('Home'),
        centerTitle: true,
        actions: const <Widget>[
          Icon(Icons.search),
          Icon(Icons.settings),
        ],
      ),
      body: const Center(
        child: Text(
          'I Komang Emo Wijaya Kusuma',
          style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),
        ),
      ),
    );
  }
}
