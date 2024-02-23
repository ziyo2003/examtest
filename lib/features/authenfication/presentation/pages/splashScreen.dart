
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF131524),
      body: Column(
        children: [
          SizedBox(height: 274),
          Center(
            child: SvgPicture.asset(
              'assets/splashscreen/splash.svg',
              width: 198,
              height: 136,
            ),
          ),
          SizedBox(height: 350),
          CircularProgressIndicator(color: Colors.white,)
        ],
      ),
    );
  }
}