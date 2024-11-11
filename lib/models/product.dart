import 'dart:ui';

class Product {
  final String name;
  final double price;
  final List<Color> colorOptions;
  final double pricePerCount;
  final String imagepath;
  String description;


  Product({
    required this.name,
    required this.price,
    required this.colorOptions,
    required this.pricePerCount,
    required this.description,
    required this.imagepath,
  });
}
