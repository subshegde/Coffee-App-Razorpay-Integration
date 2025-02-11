import 'package:coffee_shop_app/models/coffeeModel.dart';
import 'package:flutter/material.dart';

class ShopModel extends ChangeNotifier{
  // coffee for sale list
final List<Coffee> _shop = [
  Coffee(
    name: "Espresso Coffee",
    price: "₹250",
    image: "assets/images/espresso.jpg",
  ),
  Coffee(
    name: "Iced Coffee",
    price: "₹300",
    image: "assets/images/icedcoffee.jpg",
  ),
  Coffee(
    name: "Latte Coffee",
    price: "₹350",
    image: "assets/images/latte-coffee.jpg",
  ),
  Coffee(
    name: "Americano Coffee",
    price: "₹280",
    image: "assets/images/americano-coffee.jpg",
  ),
];

  // user cart
  List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToTheCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromTheCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }
double calculateTotalAmount() {
  double total = 0.0;

  for (var coffee in _userCart) {
    // Remove the rupee sign and convert the price to double
    double priceInInr = double.tryParse(coffee.price.replaceAll('₹', '')) ?? 0.0;
    total += priceInInr;
  }

  return total;
}


}