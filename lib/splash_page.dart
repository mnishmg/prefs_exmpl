import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shrd_prefs/home_page.dart';
import 'package:shrd_prefs/login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      getLoginData();
    });
    super.initState();
  }

  void getLoginData() async {
    var prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool("Login");

    if (isLogin != null) {
      if (isLogin) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Icon(
          Icons.abc,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
