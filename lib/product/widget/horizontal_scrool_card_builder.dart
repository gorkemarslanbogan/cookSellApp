import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
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
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: context.watch<cardBuilderProvider>().items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: customCard(
                title: context.watch<cardBuilderProvider>().items[index].cookName,
                description: context.watch<cardBuilderProvider>().items[index].cookDescription,
                price: context.watch<cardBuilderProvider>().items[index].price,
                score: context.watch<cardBuilderProvider>().items[index].puan,
                image: context.watch<cardBuilderProvider>().items[index].image),
          );
        },
      ),
    );
  }
}
