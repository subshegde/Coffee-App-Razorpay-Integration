import 'package:coffee_shop_app/constants/constant.dart';
import 'package:coffee_shop_app/pages/cart/pages/cartpage.dart';
import 'package:coffee_shop_app/pages/home/components/bottom_nav_bar.dart';
import 'package:coffee_shop_app/pages/shop/pages/shoppage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int seletedIndex = 0;

  void navigateBottombar(int index) {
    setState(() {
      seletedIndex = index;
    });
  }

  final List<Widget> pages = [
    const ShopPage(),
    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index)=> navigateBottombar(index),
      ),
      body: pages[seletedIndex],
    );
  }
}