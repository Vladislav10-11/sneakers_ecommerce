import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/components/search_field.dart';
import 'package:e_commerce/constances.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/screens/product_screen.dart';
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
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.menu_sharp,
            color: Colors.black,
          ),
          actions: [Icon(Icons.notification_add, color: Colors.black)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                  viewportFraction: 1.0,
                  autoPlay: true,
                  reverse: true,
                  enlargeCenterPage: false,
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
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ),
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
                                image: DecorationImage(
                                    image: AssetImage(brand.image),
                                    fit: BoxFit.fill)),
                          ),
                        ]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrial',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ),
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
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) =>
                                      ProductScreen(productData: product)),
                                ),
                              );
                            },
                            child: ProductCard(productData: product));
                      })),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    child: Icon(
                      Icons.card_giftcard,
                    ),
                    backgroundColor: greenColor,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    },
                  ),
                ],
              )
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
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
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
