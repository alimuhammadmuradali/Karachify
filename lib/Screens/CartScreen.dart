import 'package:flutter/material.dart';
import 'package:karachify/view_models/cart_notifier.dart';
import 'package:provider/provider.dart';

class cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Center(child: Text("Your Cart")), actions: <Widget>[
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
        child: context.watch<CartNotifier>().cartList.isEmpty
            ? Center(child: Text("No Item in cart"))
            : ListView.builder(
                itemCount: context.watch<CartNotifier>().cartList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        elevation: 5,
                        child: Dismissible(
                          key: Key(context
                              .watch<CartNotifier>()
                              .cartList[index]
                              .id
                              .toString()),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            context.read<CartNotifier>().deleteProduct(index);
                          },
                          child: ListTile(
                            leading: Image.network(context
                                .watch<CartNotifier>()
                                .cartList[index]
                                .image!),
                            title: Text(
                                context
                                    .watch<CartNotifier>()
                                    .cartList[index]
                                    .title!,
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                            subtitle: Text(
                              "\$${context.watch<CartNotifier>().cartList[index].price}",
                              style: TextStyle(fontSize: 16),
                            ),
                            isThreeLine: true,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
