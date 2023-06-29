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
    return Card(
      child: Text(productData.title),
    );
  }
}
