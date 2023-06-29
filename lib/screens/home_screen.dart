import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/components/search_field.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/brand_model.dart';
import '../models/product_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myActiveIndex = 0;
  final uriImages = ['assets/adidas_banner.png'];

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CartProvider>(context);

    TextEditingController _controller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu_sharp,
            color: Colors.black,
          ),
          actions: [Icon(Icons.notification_add, color: Colors.black)],
        ),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              SearchField(
                controller: _controller,
              ),
              SizedBox(
                height: 25,
              ),
              CarouselSlider.builder(
                itemCount: uriImages.length,
                itemBuilder: (context, index, realIndex) {
                  final uriImage = uriImages[index];

                  return buildImage(uriImage, index);
                },
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  reverse: true,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayInterval: Duration(seconds: 2),
                  onPageChanged: (index, reason) =>
                      setState(() => myActiveIndex = index),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              buildIndicator(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('See all')
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: productProvider.brands.length,
                  itemBuilder: (context, index) {
                    Brand brand = productProvider.brands[index];
                    return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: AssetImage(brand.image),
                                    fit: BoxFit.fill)),
                          ),
                        ]);
                  },
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrial',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('See all'),
                ],
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: productProvider.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        Product product = productProvider.products[index];
                        return ProductCard(productData: product);
                      }))
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            label: 'Like',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'account')
        ]),
      ),
    );
  }

  Widget buildImage(
    String uriImage,
    int myActiveIndex,
  ) =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(uriImage),
            //whatever image you can put here
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: myActiveIndex,
        count: uriImages.length,
        effect: JumpingDotEffect(
            dotColor: Colors.grey,
            activeDotColor: Colors.green,
            dotHeight: 10,
            dotWidth: 10),
      );
}
