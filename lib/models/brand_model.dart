import 'package:e_commerce/models/product_model.dart';

class Brand {
  final int id;
  final String title;
  final String image;
  final Category? categories;

  Brand({
    required this.image,
    required this.id,
    required this.title,
    this.categories,
  });
}
