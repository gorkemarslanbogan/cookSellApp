import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/product/widget/custom_card.dart';
import 'package:food_app_ga_coding/viewmodel/cardBuilder_provider.dart';
import 'package:provider/provider.dart';

class cardBuilder extends StatelessWidget {
  cardBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return SizedBox(
      height: ScreenSize.dynamicHeight(value: 0.38),
      child: Consumer<cardBuilderProvider>(
        builder: ((context, value, child) {
        return ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: value.items.length,
        itemBuilder: (BuildContext context, int index) {
         CookModel items = value.items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: customCard(
                title: items.cookName,
                description: items.cookDescription,
                price: items.price,
                score: items.puan,
                image: items.image),
          );
        },
      );})
      )
    );
  }
}
