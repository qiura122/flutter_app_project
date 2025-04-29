import 'package:flutter/material.dart';

class Home_scsv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF57575E)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(height: 100, color: Colors.red),
            SizedBox(height: 16),
            Container(height: 100, color: Colors.green),
            SizedBox(height: 16),
            Container(height: 100, color: Colors.blue),
            SizedBox(height: 16),
            Container(height: 100, color: Colors.yellow),
            SizedBox(height: 16),
            Container(height: 100, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}