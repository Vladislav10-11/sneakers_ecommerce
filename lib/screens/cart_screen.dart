import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CartProvider>(context);
    final cartProducts = productProvider.cartItems;
    return Scaffold(
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final cartProduct = cartProducts[index];
          return ListTile(
            title: Text(cartProduct.title),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                productProvider.removeFromCart(cartProduct);
              },
            ),
          );
        },
      ),
    );
  }
}
