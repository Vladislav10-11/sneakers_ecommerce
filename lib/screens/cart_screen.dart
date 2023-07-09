import 'package:e_commerce/constances.dart';
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
      appBar: AppBar(
        title: Text('CartScreen'),
        backgroundColor: greenColor,
      ),
      body: ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          final cartProduct = cartProducts[index];
          return ListTile(
            leading: Image.asset('assets/adik.png'),
            title: Text('Cart Item'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
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
