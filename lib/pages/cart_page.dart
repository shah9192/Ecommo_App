import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';
import 'package:ecommo/pages/checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text("Cart Page", style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: const Color(0xFFFDEEF4), // Pearl white color
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                final product = cartItem.keys.first;
                final color = cartItem.values.first;

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: color,
                      child: const Icon(Icons.color_lens, color: Colors.white),
                    ),
                    title: Text(
                      product.name,
                      style: const TextStyle(color: Colors.black), // Black text color
                    ),
                    subtitle: Text(
                      'Price: \$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black), // Black text color
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                      onPressed: () {
                        // Remove from cart with selected color
                        Provider.of<Shop>(context, listen: false)
                            .removefromcart(product, color);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              "Proceed to Checkout",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
