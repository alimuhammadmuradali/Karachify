import 'package:flutter/material.dart';
import 'package:karachify/Screens/SplashScreen.dart';
import 'package:karachify/view_models/cart_notifier.dart';
import 'package:karachify/view_models/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CartNotifier()),
      ChangeNotifierProvider(create: (_) => ProductNotifier()),
    ],
    child: MyApp(),
  ));
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
