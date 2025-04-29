import 'package:flutter/material.dart';
import 'package:flutter_app_project/UI1/home.dart';
import 'package:flutter_app_project/UI1/home_appbar.dart';
import 'package:flutter_app_project/UI1/home_button&padding.dart';
import 'package:flutter_app_project/UI1/home_container.dart';
import 'package:flutter_app_project/UI1/home_icon.dart';
import 'package:flutter_app_project/UI2/Home_row.dart';
import 'package:flutter_app_project/UI2/Home_stack.dart';
import 'package:flutter_app_project/UI2/Home_column.dart';
import 'package:flutter_app_project/UI2/Home_scsv.dart';
import 'package:flutter_app_project/UI3/Home_state.dart';
import 'package:flutter_app_project/UI3/Home_stateless.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeStateStateless(),
    );
  }
}