import 'package:flutter/material.dart';


class AppTheme {
  static final light = ThemeData.light(useMaterial3: true).copyWith(
          appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:
          IconThemeData(color: Colors.black, size: 30, opacity: 80.0),
        ));
}