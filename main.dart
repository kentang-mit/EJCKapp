import 'package:flutter/material.dart';
import 'booklist.dart';
import 'sjtu_login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'EJCK',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Booklist(),
      home: LoginPage(),
    );
  }
}
