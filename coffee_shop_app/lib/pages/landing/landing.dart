import 'package:coffee_shop_app/components/button.dart';
import 'package:coffee_shop_app/constants/constant.dart';
import 'package:coffee_shop_app/pages/home/views/home.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: 
      Column(
        children: [
          const SizedBox(height: 150,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Image.asset('assets/images/espresso-nobg.png',scale: 4,)),
          ],
        ),

        const Text('Welcome to Coffee Shop',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.brown),),
        const SizedBox(height: 10,),
        const Text('How do you like your coffee?',style: TextStyle(fontSize: 12,color: Colors.brown),),

        const SizedBox(height: 20,),
        Container(
          margin: const EdgeInsets.all(20),
          child: MyButton(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              text: 'Enter Show',
             ),
        ),
      ],)
      ),
    );
  }
}