import 'package:flutter/material.dart';

class ScreenSize {
  static double? dynamicsHeight;
  static double? dynamicsWidth;
  late MediaQueryData _mediaQuery;

  void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    dynamicsHeight = _mediaQuery.size.height;
    dynamicsWidth = _mediaQuery.size.width;
  }
  
  static double dynamicHeight({double? value}) {
    if (value != null) {
      return dynamicsHeight! * value;
    } else {
      return dynamicsHeight!;
    }
  }

  static double dynamicWidth({double? value}) {
    if (value != null) {
      return dynamicsWidth! * value;
    } else {
      return dynamicsWidth!;
    }
  }
}
