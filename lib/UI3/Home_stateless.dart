import 'package:flutter/material.dart';

class HomeStateStateless extends StatelessWidget {
  final int data = 0; // Data tetap karena StatelessWidget tidak memiliki state.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic State Management (Stateless)'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$data', // Menampilkan nilai data.
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                // Tidak ada perubahan state karena ini StatelessWidget.
                print('Button pressed, but no state change.');
              },
              child: const Text('PLUS +1'),
            ),
          ],
        ),
      ),
    );
  }
}