import 'package:e_commerce/constances.dart';
import 'package:e_commerce/controllers/navigation.dart';
import 'package:e_commerce/screens/favorite_screen.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/screens/productslist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<dynamic> screens = [
    HomeScreen(),
    ProductListScreen(),
    FavoriteScreen(),
    ProductListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    NavigationController navigation = Provider.of<NavigationController>(
      context,
    );
    int currentScreenIndex = navigation.fetchCurrentScreenIndex;

    return Scaffold(
      body: screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            navigation.updateScreenIndex(value);
          },
          currentIndex: currentScreenIndex,
          fixedColor: greenColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.redeem,
                color: Colors.black,
              ),
              label: 'Deals',
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
                label: 'Account')
          ]),
    );
  }
}
