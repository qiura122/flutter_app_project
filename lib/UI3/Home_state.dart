import 'package:flutter/material.dart';

class HomeState extends StatefulWidget {
  @override
  State<HomeState> createState() => Home_state();
}

class Home_state extends State<HomeState> {
  int _data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic State Management'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_data',
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                _data++;
                setState(() {});
                print(_data);
              },
              child: const Text('PLUS +1'),
            ),
          ],
        ),
      ),
    );
  }
}
