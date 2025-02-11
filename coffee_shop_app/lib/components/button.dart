import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
 final  void Function()? onTap;
  MyButton({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(child: Text('$text',style: const TextStyle(color: Colors.white),),),
              ),
            );
  }
}