import 'package:flutter/material.dart';
import 'package:loginpage_ujilvl/listpage.dart';
import 'dart:math';

import 'package:loginpage_ujilvl/loginpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any code to perform some task before showing the splash screen
    Future.delayed(Duration(seconds: 2), () {
      // Add your navigation logic here
      // For example, navigate to home screen after 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        color: Color(0xffF6F4FF),
        child: Align(
            alignment: Alignment(0, 0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Solution',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Color(
                          0xff8BD0FF), // Ubah warna sesuai yang diinginkan
                    ),
                  ),
                  TextSpan(
                    text: ' Mind',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Color(
                          0xff8E8E8E), // Ubah warna sesuai yang diinginkan
                    ),
                  ),
                ],
              ),
            )),
      )),
    );
  }
}
