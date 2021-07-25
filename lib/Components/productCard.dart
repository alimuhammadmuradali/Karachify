import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:karachify/models/productModel.dart';
import 'package:karachify/view_models/cart_notifier.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final productModel product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double width = 150;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: SizedBox(
              width: width,
              height: 235,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.02,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.network(widget.product.image!),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.title!,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                      ),
                      Text(
                        "\$${widget.product.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.product.description!,
                    style: TextStyle(color: Colors.black),
                    maxLines: 3,
                  ),
                ],
              )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 4),
        child: Container(
          height: 40,
          child: FloatingActionButton(
              onPressed: () => {
                    if (!context
                        .read<CartNotifier>()
                        .cartList
                        .contains(widget.product))
                      {
                        context.read<CartNotifier>().addProduct(widget.product),
                        Fluttertoast.showToast(
                            msg: "Product Added to Cart",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 13.0),
                      }
                  },
              child: Icon(
                Icons.add,
                size: 20,
              )),
        ),
      )
    ]);
  }
}
