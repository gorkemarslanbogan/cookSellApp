import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/navigatorManagment/navigatorRoutes.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
import 'package:food_app_ga_coding/product/theme/theme.dart';
import 'package:food_app_ga_coding/product/utility/app_padding.dart';
import 'package:food_app_ga_coding/product/widget/app-bar-widget.dart';
import 'package:food_app_ga_coding/product/widget/mainColumnItems.dart';
import 'package:food_app_ga_coding/screens/details.dart';
import 'package:food_app_ga_coding/viewmodel/cardBuilder_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<cardBuilderProvider?>(
      create: (_) => cardBuilderProvider(),
    )
  ], builder: (context, child) => const mainScreen()));
}

class mainScreen extends StatelessWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const Home() 
        );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return Scaffold(
            appBar: const appbarWidget(),
            body: SizedBox(
                height: ScreenSize.dynamicsHeight,
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: appPadding.generalSymectritPadding,
                    child: columnItems(),
                  ),
                )));

  }
}