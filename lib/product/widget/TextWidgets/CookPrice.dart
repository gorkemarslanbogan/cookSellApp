import 'package:flutter/material.dart';



class CookPrice extends Text {
   CookPrice({
   required BuildContext context, required this.price, required this.color
  }) : super("\$$price",style: Theme.of(context).textTheme.headline6?.copyWith(
      color: color,
    ),);
 final double price;
 final Color color;
}