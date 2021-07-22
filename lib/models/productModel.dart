import 'package:flutter/material.dart';

class productModel {
  final int? id;
  final String? title, description;
  final String? image;
  final double? price;

  productModel(
      {@required this.id,
      @required this.image,
      @required this.title,
      @required this.price,
      @required this.description});
}
