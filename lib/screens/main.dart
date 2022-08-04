import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
import 'package:food_app_ga_coding/product/utility/app_padding.dart';
import 'package:food_app_ga_coding/product/utility/text_utility.dart';
import 'package:food_app_ga_coding/product/widget/app-bar-widget.dart';
import 'package:food_app_ga_coding/product/widget/custom_text_field.dart';
import 'package:food_app_ga_coding/product/widget/horizontal_scrool_card_builder.dart';
import 'package:food_app_ga_coding/viewmodel/cardBuilder_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => cardBuilderProvider()))],
    builder: (context, child) => mainScreen()));
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
        iconTheme: IconThemeData(color: Colors.black, size: 30, opacity: 80.0),
      )),
      home: ChangeNotifierProvider(
        builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: (){
             context.read<cardBuilderProvider>().updatePrice(15.99);
          }),
          appBar: const appbarWidget(),
          body: SizedBox(
            height: ScreenSize.dynamicsHeight,
            child: SingleChildScrollView(
              child: Padding(
                padding: appPadding.generalSymectritPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textUtility.mainTittle,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 30,),
                    const customTextField(),
                    const SizedBox(height: 30,),
                   const textWidget(title: textUtility.recommend,),
                    cardBuilder(),
                    const SizedBox(height: 10,),
                   const  textWidget(title: textUtility.recipes,),
                  ],
                ),
              ),
            ),
          ),
        );  
        },
        create: (context) => cardBuilderProvider(),
        ) 
      );
  }
}

class textWidget extends StatelessWidget {
   const textWidget({ Key? key, required this.title }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}