import 'package:flutter/material.dart';
import 'package:karachify/Screens/SplashScreen.dart';
import 'package:karachify/provider/cart_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CartNotifier(), child: MyApp()));
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
