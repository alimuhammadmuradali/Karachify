import 'package:flutter/material.dart';
import 'package:karachify/Components/productCard.dart';
import 'package:karachify/view_models/product_provider.dart';
import 'package:provider/provider.dart';

class ScrollableProducts extends StatefulWidget {
  final String title;

  ScrollableProducts({Key? key, required this.title}) : super(key: key);

  @override
  _ScrollableProductsState createState() => _ScrollableProductsState();
}

class _ScrollableProductsState extends State<ScrollableProducts> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductNotifier>(context, listen: false).fetchProduct();
  }

  Widget view(ProductNotifier provider) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            provider.products!.length,
            (index) {
              return ProductCard(product: provider.products![index]);
            },
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildUI(ProductNotifier provider) {
    if (provider.products == null) {
      return Align(child: CircularProgressIndicator());
    } else if (provider.products!.isEmpty) {
      return Align(
        child: Text("No movies Found"),
      );
    }
    return view(provider);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductNotifier>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            )),
        SizedBox(height: 20),
        _buildUI(provider)
      ],
    );
  }
}
