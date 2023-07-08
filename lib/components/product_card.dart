import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product productData;
  const ProductCard({
    required this.productData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Icon(Icons.favorite, size: 20, color: Colors.red)],
            ),
            Row(
              children: [
                SizedBox(width: 85, child: Image.asset(productData.image[0])),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(productData.title),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.orangeAccent,
                    ),
                    Text(productData.rating.toString()),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text(
                  '\$${productData.price.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
