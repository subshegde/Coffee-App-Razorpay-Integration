import 'package:coffee_shop_app/constants/constant.dart';
import 'package:coffee_shop_app/models/coffeeModel.dart';
import 'package:coffee_shop_app/models/shopModel.dart';
import 'package:coffee_shop_app/pages/cart/components/success.dart';
import 'package:coffee_shop_app/pages/landing/landing.dart';
import 'package:coffee_shop_app/pages/shop/components/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add to cart
  void addToCart(Coffee coffee){
    Provider.of<ShopModel>(context,listen: false).addItemToTheCart(coffee);
    showSuccessToast('${coffee.name} added to the cart');
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModel>(builder:(context, value, child) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const LandingPage()));
            },
          ),
        ],
        title: const Text('Your Coffee Shop',style: TextStyle(fontSize: 20,),),),
      backgroundColor: backgroundColor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          const SizedBox(height: 25),

          Expanded(child: 
          ListView.builder(
            itemCount: value.coffeeShop.length,
            itemBuilder: (context, index){
              Coffee eachCoffee = value.coffeeShop[index];
              return CoffeeTile(
                icon: const Icon(Icons.add),
                coffee: eachCoffee,
                onPressed: (){
                  addToCart(eachCoffee);
                },
              );
            },
            ))
        ],),
        
        )),
    ),);
  }
}