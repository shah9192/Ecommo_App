import 'package:ecommo/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_product_tile.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'cart_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text("Shop Page", style: TextStyle(color: Colors.black)),
        actions: [
          DragTarget<Product>(
            builder: (context, candidateData, rejectedData) {
              return IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              );
            },
            onAcceptWithDetails: (product) {
              // Add the product to the cart when it’s dropped onto the cart icon
              Provider.of<Shop>(context, listen: false).addtocart(product as Product, Colors.black);
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: const Color(0xFFFDEEF4), // Pearl white color
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Center(
            child: Text(
              "Pick from list of premium products",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: products.map((product) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MyProductTile(product: product),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
