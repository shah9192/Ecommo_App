import 'package:ecommo/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/shop.dart';
import 'pages/shop_page.dart';
import 'pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyC2I1l5Zg5NjPI_XiSsYecxXIYRSUmB2m0",
        authDomain: "ecommo-39200.firebaseapp.com",
        projectId: "ecommo-39200",
        storageBucket: "ecommo-39200.firebasestorage.app",
        messagingSenderId: "286912530014",
        appId: "1:286912530014:web:2ec246e9907223af7296cf",
        measurementId:"G-4LQM92XXT9"
    ),
  );
  runApp(MyApp());
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
        '/intro_page': (context) => const IntroPage(), // Added this route
      },
    );
  }
}
