import 'package:coffee_shop_app/models/shopModel.dart';
import 'package:coffee_shop_app/pages/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=> ShopModel(),
    builder: (context, child) => const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    ),
    );
  }
}
