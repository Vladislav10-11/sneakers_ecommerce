import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/constances.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: Text("Product"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              shrinkWrap: true,
              itemCount: productsData.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  productData: productsData.products[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
