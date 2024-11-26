import 'package:ecommo/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8BBD0), Color(0xFFFFECB3)], // Pink to yellow
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Drawer Header
                DrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFEC407A), Color(0xFFFFC107)], // Dark pink to amber
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        size: 72,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Ecommo Shop",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Shop List Tile
                MyListTile(
                  text: "Shop",
                  icon: Icons.home,
                  onTap: () => Navigator.pop(context),
                  textColor: Colors.black,
                  iconColor: Colors.pink,
                ),

                // Cart List Tile
                MyListTile(
                  text: "Cart",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  },
                  textColor: Colors.black,
                  iconColor: Colors.orange,
                ),
              ],
            ),

            // Exit List Tile
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: MyListTile(
                text: "Exit",
                icon: Icons.logout,
                onTap: () {
                  // Navigate to the intro page and remove all previous routes
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/intro_page',  // Route name for the intro page
                        (route) => false, // Remove all previous routes
                  );
                },
                textColor: Colors.black,
                iconColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
