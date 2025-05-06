import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListViewBuilder extends StatelessWidget {
  final List<String> bulan = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text("List View Builder by Komang Emo"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bulan.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                bulan[index],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.calendar_month, color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
