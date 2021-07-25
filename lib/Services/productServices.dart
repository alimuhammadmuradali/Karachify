import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:karachify/models/productModel.dart';

class productServices {
  var localHost = 'http://192.168.0.110:5000/';

  List<productModel> parseData(String responseBody) {
    var list = json.decode(responseBody.toString())['data'];
    print(list);
    List<productModel> data = list
        .map<productModel>((model) => productModel.fromJson(model))
        .toList();
    return data;
  }

  Future<List<productModel>> getProducts() async {
    var response = await http.get(
      Uri.parse(localHost + 'api/products'),
    );
    return parseData(response.body);
  }
}
