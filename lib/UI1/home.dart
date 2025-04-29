import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: Colors.deepPurpleAccent),
      body: const Center(
        child: Text(
          'I Komang Emo Wijaya Kusuma',
          style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),
        ),
      ),
    );
  }
}
