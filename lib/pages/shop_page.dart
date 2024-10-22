import 'package:ecommo/components/my_drawer.dart';
import 'package:ecommo/components/my_product_tile.dart';
import 'package:ecommo/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return  Scaffold(appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Shop Page"),
    ),
      drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,

      body: ListView(
        children:
         [ const SizedBox(height:25),
          Center(child: Text("Pick from list of premium products",
         style:TextStyle(color: Theme.of(context).colorScheme.inversePrimary)
      ),
)
        ],
      ),



    );
  }
}
