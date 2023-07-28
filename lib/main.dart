import 'package:flutter/material.dart';
import 'package:loginpage_ujilvl/details.dart';
import 'package:loginpage_ujilvl/listpage.dart';
import 'package:loginpage_ujilvl/myapp.dart';
import 'package:loginpage_ujilvl/profile.dart';
import 'package:loginpage_ujilvl/splashscreen.dart';
import 'loginpage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',  
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen
      (),
    );
  }
}
