import 'package:flutter/material.dart';
import 'package:login_practice/dioPractice/imgScreen.dart';
import 'package:login_practice/jsonPrctice/UserList.dart';
import 'package:login_practice/screen/http_practice.dart';
import 'package:login_practice/screen/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LoginApp",
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: ImgScreen(),
    );
  }
}
