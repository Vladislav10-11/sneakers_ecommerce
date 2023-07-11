import 'package:e_commerce/components/bottom_navigation_bar.dart';
import 'package:e_commerce/controllers/navigation.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationController>(
          create: (_) => NavigationController(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigation(),
      ),
    );
  }
}
