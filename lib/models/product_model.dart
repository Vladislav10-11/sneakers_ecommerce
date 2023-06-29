import 'package:e_commerce/models/brand_model.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String footSize;
  final String image;
  final bool favorite;
  final double rating;
  final double price;
  final Category? category;
  final Brand brand;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.footSize,
    required this.image,
    required this.favorite,
    required this.rating,
    required this.price,
    this.category,
    required this.brand,
    this.quantity = 0,
  });
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}
