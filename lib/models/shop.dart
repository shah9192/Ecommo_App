import 'package:flutter/material.dart';
import 'product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Rado Watch",
      price: 3500,
      description: "Innovative skeleton watch with transparent dial.",
      imagepath: 'assets/rado.jpg',
      colorOptions: [Colors.black, Colors.grey, Colors.blue],
      pricePerCount: 3500,
    ),
    Product(
      name: "Smart Watch",
      price: 4000,
      description: "Advanced smartwatch with fitness tracking and notifications.",
      imagepath: 'assets/smartwatch.jpg',
      colorOptions: [Colors.black, Colors.white, Colors.red],
      pricePerCount: 4000,
    ),
    Product(
      name: "Skmei Watch Original",
      price: 4000,
      description: "Meet The World Beyond Future",
      imagepath: 'assets/skmei.jpg',
      colorOptions: [Colors.black, Colors.grey, Colors.blue],
      pricePerCount: 4000,
    ),
    Product(
      name: "Patek Phillipe",
      price: 4999,
      description: "You never actually own a Patek Philippe. You merely look after it for the next generation",
      imagepath: 'assets/pp.jpg',
      colorOptions: [Colors.black, Colors.grey, Colors.blue],
      pricePerCount: 4000,
    ),
  ];

  final List<Map<Product, Color>> _cart = [];

  List<Product> get shop => _shop;
  List<Map<Product, Color>> get cart => _cart;

  void addtocart(Product item, Color color) {
    bool itemExists = _cart.any((cartItem) => cartItem.keys.first == item && cartItem.values.first == color);
    if (!itemExists) {
      _cart.add({item: color});
      notifyListeners();
    }
  }

  void removefromcart(Product item, Color color) {
    _cart.removeWhere((cartItem) => cartItem.keys.first == item && cartItem.values.first == color);
    notifyListeners();
  }
}
