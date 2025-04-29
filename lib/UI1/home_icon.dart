import 'package:flutter/material.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: const Center(
        child: Icon(Icons.face, size: 100, color: Colors.deepPurpleAccent),
      ),
    );
  }
}
