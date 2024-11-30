import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  // Import Provider
import 'models/shop.dart';  // Import Shop model
import 'pages/shop_page.dart';  // Import ShopPage
import 'pages/cart_page.dart';  // Import CartPage
import 'pages/intro_page.dart';  // Import IntroPage
import 'firebase_options.dart';  // Import Firebase options
import 'package:firebase_core/firebase_core.dart';  // Import Firebase core

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
        measurementId: "G-4LQM92XXT9"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(  // Ensure that the provider is accessible throughout the app
      providers: [
        ChangeNotifierProvider(create: (_) => Shop()),  // Provide Shop model
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const IntroPage(),  // Start with IntroPage
        routes: {
          '/shop_page': (context) => const ShopPage(),
          '/cart_page': (context) => const CartPage(),  // CartPage route
          '/intro_page': (context) => const IntroPage(), // IntroPage route
        },
      ),
    );
  }
}