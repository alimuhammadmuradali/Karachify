import 'package:flutter/material.dart';
import 'package:karachify/Components/DiscountBanner.dart';
import 'package:karachify/Components/ScrollableProducts.dart';
import 'package:karachify/Screens/CartScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar:
            AppBar(title: Center(child: Text("Karachify")), actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => cart()),
                  );
                },
                child: Icon(Icons.shopping_bag_outlined),
              )),
        ]),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                DiscountBanner(),
                ScrollableProducts("Popular Products"),
                SizedBox(height: 30),
                ScrollableProducts("Top Sales"),
                SizedBox(height: 30),
                ScrollableProducts("Most Viewed"),
                SizedBox(height: 30),
              ],
            ),
          ),
        ));
  }
}
