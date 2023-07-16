import 'package:e_commerce/components/photo_component.dart';
import 'package:e_commerce/components/size_component.dart';
import 'package:e_commerce/constances.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:provider/provider.dart';
import 'dart:core';

import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends StatefulWidget {
  final Product productData;

  const ProductScreen({
    super.key,
    required this.productData,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Product Details',
            style: TextStyle(color: blackColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: blackColor,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.productData.image[0]),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.productData.image.length,
                  itemBuilder: ((context, index) {
                    return PhotoComponent(
                        productPhoto: widget.productData.image[index]);
                  }),
                ),
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                          ),
                          Text(widget.productData.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.productData.title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${widget.productData.price}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selected Size',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () async {
                          var url = Uri.parse('https://blog.logrocket.com/');
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Text(
                          'Size Chart',
                          style: TextStyle(color: greenColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.productData.footSize.length,
                          itemBuilder: (context, index) {
                            return SizeComponent(
                              size: widget.productData.footSize[index],
                            );
                          })),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0), backgroundColor: greenColor),
            child: Text(
              'Buy Now',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addToCart(widget.productData);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ),
      ),
    );
  }
}
