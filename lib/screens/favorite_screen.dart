import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProductsProvider = Provider.of<CartProvider>(context);
    final favoriteProducts = favoriteProductsProvider.favoriteProducts;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Screen'),
      ),
      body: Column(children: [
        Padding(padding: EdgeInsets.all(20.0)),
        favoriteProducts != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(productData: favoriteProducts[index]);
                },
              )
            : Center(
                child: Text('No Favorite Products Selected'),
              )
      ]),
    );
  }
}
