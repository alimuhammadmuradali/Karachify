import 'package:flutter/material.dart';
import 'package:karachify/Components/products.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  _cartState createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar:
            AppBar(title: Center(child: Text("Your Cart")), actions: <Widget>[
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
        body: Container(
          color: Colors.grey,
          child: CartProduct.isEmpty
              ? Center(child: Text("No Item in cart"))
              : ListView.builder(
                  itemCount: CartProduct.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          elevation: 5,
                          child: Dismissible(
                            key: Key(CartProduct[index].id.toString()),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                CartProduct.removeAt(index);
                              });
                            },
                            child: ListTile(
                              leading: Image.asset(CartProduct[index].image!),
                              title: Text(CartProduct[index].title!,
                                  style: TextStyle(
                                    fontSize: 18,
                                  )),
                              subtitle: Text(
                                "\$${CartProduct[index].price}",
                                style: TextStyle(fontSize: 16),
                              ),
                              isThreeLine: true,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
        ));
  }
}
