import 'package:flutter/material.dart';
import 'package:karachify/Services/productServices.dart';

class productModel {
  String? id;
  String? title, description;
  String? image;
  int? price;

  productModel(
      {@required this.id,
      @required this.image,
      @required this.title,
      @required this.price,
      @required this.description});

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    price = json['price'].toInt();
    description = json['description'];
    image = '${productServices().localHost}uploads/' + json['image'];
  }
}
