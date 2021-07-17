import 'package:flutter/material.dart';

class Product {
  final int? id;
  final String? title, description;
  final String? image;
  final double? price;

  Product(
      {@required this.id,
      @required this.image,
      @required this.title,
      @required this.price,
      @required this.description});
}

// Our demo Products

List<Product> products = [
  Product(
    id: 1,
    image: "assets/images/shirt.jpg",
    title: "Shirt",
    price: 750,
    description:
        "Dressing is a way of life. Dress yourself with our elegant shirts collection.We have a wide range of shirts collection including printed shirts",
  ),
  Product(
    id: 2,
    image: "assets/images/pant1.jpg",
    title: "Man Pant",
    price: 50.5,
    description:
        "Dressing is a way of life. Dress yourself with our elegant shirts collection.We have a wide range of shirts collection including printed shirts",
  ),
  Product(
    id: 3,
    image: "assets/images/shirt2.jpg",
    title: "Shirt",
    price: 600,
    description:
        "Dressing is a way of life. Dress yourself with our elegant shirts collection.We have a wide range of shirts collection including printed shirts",
  ),
  Product(
    id: 4,
    image: "assets/images/pant2.jpg",
    title: "Pant",
    price: 900,
    description:
        "Dressing is a way of life. Dress yourself with our elegant shirts collection.We have a wide range of shirts collection including printed shirts",
  ),
  Product(
    id: 5,
    image: "assets/images/pant3.jpg",
    title: "Pant",
    price: 700,
    description:
        "Dressing is a way of life. Dress yourself with our elegant shirts collection.We have a wide range of shirts collection including printed shirts",
  ),
];
List<Product> CartProduct = [];
