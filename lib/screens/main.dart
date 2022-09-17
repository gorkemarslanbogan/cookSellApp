import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
import 'package:food_app_ga_coding/product/utility/app_padding.dart';
import 'package:food_app_ga_coding/product/widget/app-bar-widget.dart';
import 'package:food_app_ga_coding/product/widget/mainColumnItems.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: const [], builder: (context, child) => mainScreen()));
}

class mainScreen extends StatelessWidget with ScreenSize {
  mainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:
          IconThemeData(color: Colors.black, size: 30, opacity: 80.0),
        )),
        home: Scaffold(
            appBar: const appbarWidget(),
            body: SizedBox(
                height: ScreenSize.dynamicsHeight,
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: appPadding.generalSymectritPadding,
                    child: columnItems(),
                  ),
                ))));
  }
}

