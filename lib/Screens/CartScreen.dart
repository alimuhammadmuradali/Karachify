import 'package:flutter/material.dart';
import 'package:karachify/provider/cart_notifier.dart';
import 'package:provider/provider.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //   CartNotifier cartNotifier = Provider.of<CartNotifier>(context);
    print("user list rebuilt");
    return Consumer<CartNotifier>(
      builder: (context, notifier, _) => Scaffold(
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
            child: notifier.cartList.isEmpty
                ? Center(child: Text("No Item in cart"))
                : ListView.builder(
                    itemCount: notifier.cartList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 5,
                            child: Dismissible(
                              key: Key(notifier.cartList[index].id.toString()),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                notifier.deleteProduct(index);
                              },
                              child: ListTile(
                                leading: Image.asset(
                                    notifier.cartList[index].image!),
                                title: Text(notifier.cartList[index].title!,
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                subtitle: Text(
                                  "\$${notifier.cartList[index].price}",
                                  style: TextStyle(fontSize: 16),
                                ),
                                isThreeLine: true,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
          )),
    );
  }
}
