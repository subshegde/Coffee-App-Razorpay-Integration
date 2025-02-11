import 'package:coffee_shop_app/components/button.dart';
import 'package:coffee_shop_app/constants/constant.dart';
import 'package:coffee_shop_app/models/coffeeModel.dart';
import 'package:coffee_shop_app/models/shopModel.dart';
import 'package:coffee_shop_app/pages/cart/components/success.dart';
import 'package:coffee_shop_app/pages/shop/components/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  double amount = 0.0;

  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    calculateAmt();

  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  // Do something when payment succeeds
  Fluttertoast.showToast(
        msg: "Payment success!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );

}

void _handlePaymentError(PaymentFailureResponse response) {
  print('response ${response.message}');
  // Do something when payment fails
    Fluttertoast.showToast(
        msg: "Payment failed!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

}

void _handleExternalWallet(ExternalWalletResponse response) {
  // Do something when an external wallet was selected
}



  void calculateAmt(){
    amount = Provider.of<ShopModel>(context,listen: false).calculateTotalAmount();
  }


  // add to cart
  void removeFromCart(Coffee coffee){
    Provider.of<ShopModel>(context,listen: false).removeItemFromTheCart(coffee);
    showSuccessToast('${coffee.name} removed to the cart');
    calculateAmt();
  }

  void payNow(){
    var options = {
    'key': '', // your key goes here
    'amount': amount * 100,
    'name': 'SSHegde.Visuals',
    'description': 'Coffe bills',
    'timeout': 60,
    // add users contact & email
    // 'prefill': {
    //   'contact': '8888888888',
    //   'email': 'test@razorpay.com'
    // }
};
  _razorpay.open(options);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ShopModel>(builder:(context, value, child) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz),onPressed: () {},),
        ],
        title: const Text('Your Cart',style: TextStyle(fontSize: 20,),),),
      backgroundColor: backgroundColor,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          const SizedBox(height: 10),
          Expanded(child: 
          ListView.builder(
            itemCount: value.userCart.length,
            itemBuilder: (context, index){
              Coffee eachCoffee = value.userCart[index];
              return CoffeeTile(
                icon: const Icon(Icons.remove),
                coffee: eachCoffee,
                onPressed: (){
                  removeFromCart(eachCoffee);
                },
              );
            },
            )),

            if(value.userCart.isNotEmpty)
            Text('Amount to be paied rupees ${amount}',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            if(value.userCart.isNotEmpty)
           MyButton(
            onTap: payNow,
            text: 'Pay Now',
           ),
        ],),
        
        )),
    ),);
  }
}