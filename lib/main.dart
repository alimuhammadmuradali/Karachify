import 'package:flutter/material.dart';
import 'package:karachify/Screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Karachify',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
        //MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
