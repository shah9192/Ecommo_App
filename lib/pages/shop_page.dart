import 'package:ecommo/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_product_tile.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'cart_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    final filteredProducts = products.where((product) {
      return product.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 0,
        foregroundColor: Colors.white,
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search products...",
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          DragTarget<Product>(
            builder: (context, candidateData, rejectedData) {
              return IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              );
            },
            onAcceptWithDetails: (product) {
              Provider.of<Shop>(context, listen: false)
                  .addtocart(product as Product, Colors.black);
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
              "Pick from a list of premium products",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filteredProducts.map((product) {
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
