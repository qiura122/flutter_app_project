import 'package:flutter/material.dart';

class HomeButtonPadding extends StatelessWidget {
  const HomeButtonPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), backgroundColor: Colors.deepPurpleAccent),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            print('Hi, I am Komang Emo!');
          },
          onLongPress: () {
            print('NIM: 2315354082');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.black,
            padding: EdgeInsets.all(16),
          ),
          child: const Text('Click Me'),
        ),
      ),
    );
  }
}
