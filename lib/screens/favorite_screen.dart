import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/constances.dart';
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
        backgroundColor: greenColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: favoriteProducts.isNotEmpty
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(productData: favoriteProducts[index]);
                },
              )
            : Center(
                child: Text(
                  'No Favorite Products Selected',
                  style: TextStyle(color: blackColor, fontSize: 24),
                ),
              ),
      ),
    );
  }
}
