import 'package:flutter/material.dart';
import 'package:karachify/Components/productCard.dart';
import 'package:karachify/Components/products.dart';

class ScrollableProducts extends StatelessWidget {
  ScrollableProducts(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            )),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                  return ProductCard(product: products[index]);
                },
              ),
              SizedBox(width: 20),
            ],
          ),
        )
      ],
    );
  }
}
