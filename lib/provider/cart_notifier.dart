import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:karachify/models/productModel.dart';

class CartNotifier extends ChangeNotifier {
  List<productModel> _cartList = [];

  UnmodifiableListView<productModel> get cartList =>
      UnmodifiableListView(_cartList);

  addProduct(productModel product) {
    print(product);
    _cartList.add(product);
    notifyListeners();
  }

  deleteProduct(index) {
    _cartList.removeAt(index);
    notifyListeners();
  }
}
