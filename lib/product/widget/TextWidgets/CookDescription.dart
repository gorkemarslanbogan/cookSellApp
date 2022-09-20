import 'package:flutter/material.dart';


class CookDescription extends Text {
  CookDescription({required BuildContext context,required this.title}) : super(title, style: 
  Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.grey,),maxLines: 3,overflow: TextOverflow.clip,textAlign: TextAlign.justify);
final String title;
}