import 'package:flutter/cupertino.dart';
import 'package:karachify/Services/productServices.dart';
import 'package:karachify/models/productModel.dart';

class ProductNotifier extends ChangeNotifier {
  var products;

  fetchProduct() async {
    products = await productServices().getProducts();
    print(products);
    notifyListeners();
  }
}
