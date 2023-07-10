import 'package:e_commerce/models/brand_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Brand> brands = [
    Brand(id: 0, title: 'Puma', image: 'assets/puma.png'),
    Brand(id: 0, title: 'Adidas', image: 'assets/adik.png'),
    Brand(id: 0, title: 'Nike', image: 'assets/nike.png'),
    Brand(id: 0, title: 'Balenciaga', image: 'assets/balensa.png'),
  ];
  List<Product> products = [
    Product(
      id: 0,
      title: 'Adidas',
      description: 'Adidas sneakers',
      footSize: [
        '33',
        '34',
        '35',
        '36',
      ],
      image: [
        'assets/shoes_1.png',
        'assets/shoes_1.png',
      ],
      favorite: true,
      rating: 1.2,
      price: 88.00,
      brand: Brand(
        image: '',
        id: 0,
        title: 'nike',
        categories: Category(
          id: 0,
          name: 'nice',
        ),
      ),
    ),
    Product(
      id: 0,
      title: 'Adidas',
      description: 'Adidas sneakers',
      footSize: [
        '33',
        '34',
        '35',
        '36',
      ],
      image: ['assets/shoes_1.png', 'assets/shoes_1.png'],
      favorite: false,
      rating: 1.2,
      price: 88.00,
      brand: Brand(
        image: '',
        id: 0,
        title: 'nike',
        categories: Category(
          id: 0,
          name: 'nice',
        ),
      ),
    ),
    Product(
      id: 0,
      title: 'Adidas',
      description: 'Adidas sneakers',
      footSize: [
        '33',
        '34',
        '35',
        '36',
      ],
      image: ['assets/shoes_1.png', 'assets/shoes_1.png'],
      favorite: false,
      rating: 1.2,
      price: 88.00,
      brand: Brand(
        image: '',
        id: 0,
        title: 'nike',
        categories: Category(
          id: 0,
          name: 'nice',
        ),
      ),
    ),
  ];
  List<Product> _cartItems = [];
  List<Product> _favoriteProducts = [];
  List<Product> get favoriteProducts => _favoriteProducts;
  List<Product> get cartItems => _cartItems;

  void setFavoriteProduct(Product product) {
    _favoriteProducts.add(product);
    notifyListeners();
  }

  void addToCart(Product product) {
    final existingProductIndex =
        _cartItems.indexWhere((item) => item.id == product.id);

    if (existingProductIndex != -1) {
      _cartItems[existingProductIndex].quantity += 1;
    } else {
      product.quantity = 1;
      _cartItems.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    if (product.quantity > 1) {
      product.quantity -= 1;
    } else {
      _cartItems.remove(product);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
