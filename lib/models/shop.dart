import 'package:ecommo/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  final List<Product> _shop = [
  Product(name: "Rado Watch",
      price: 3500,
      description: "The Rado Skeleton watch showcases an innovative design that beautifully reveals its intricate mechanical movement. Crafted with a sleek, lightweight case, the watch features a transparent dial that highlights the craftsmanship and precision of its automatic movement. ",
     imagepath: 'assets/rado.jpg'
  ),
    Product(name: "Smart Watch",
      price: 4000,
      description: "The smartwatch combines advanced technology with stylish design, offering a seamless experience for the modern user. With features like fitness tracking, heart rate monitoring, and customizable notifications, it keeps you connected and motivated throughout the day.",
      imagepath: 'assets/smartwatch.jpg'
    ),
  ];
  List <Product> _cart = [];



  List <Product> get shop => _shop;


  List <Product> get cart => _shop;



  void addtocart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  void removefromcart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}