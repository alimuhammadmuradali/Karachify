import 'dart:async';
import 'package:flutter/material.dart';
import 'package:karachify/Screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(new Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: new Image(
          //  fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width * 0.65,
          height: MediaQuery.of(context).size.height * 0.20,
          image: new AssetImage('assets/images/karachify3.png'),
        ),
      ),
    );
  }
}
