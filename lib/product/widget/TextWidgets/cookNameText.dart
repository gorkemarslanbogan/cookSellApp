import 'package:flutter/material.dart';


class cookName extends Text {
   cookName({required BuildContext context, required this.title}) 
   :super(title,style: Theme.of(context).textTheme.headline6?.copyWith(
    fontWeight: FontWeight.w600,
   ));
  final String title;
}