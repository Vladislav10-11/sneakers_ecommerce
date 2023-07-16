import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/components/search_field.dart';
import 'package:e_commerce/constances.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  TextEditingController _controller = TextEditingController();

  List<Product> items = [];
  late CartProvider productsData;
  @override
  void initState() {
    productsData = Provider.of<CartProvider>(context, listen: false);
    items = productsData.products;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = productsData.products
          .where(
              (item) => item.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
          SearchField(
            onChanged: (value) => filterSearchResults(value),
            controller: _controller,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) =>
                            ProductScreen(productData: items[index])),
                      ),
                    );
                  },
                  child: ProductCard(
                    productData: items[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
