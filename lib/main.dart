import 'package:ecommo/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/shop.dart';
import 'pages/shop_page.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Shop()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(), // Start with the IntroPage
      routes: {
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(), // Define ShopPage route
      },
    );
  }
}
