import 'package:flutter/material.dart';

class GreytTitle extends Text {
  GreytTitle({required BuildContext context,required this.title}) : super(title, style: 
  Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.grey,));
final String title;
}