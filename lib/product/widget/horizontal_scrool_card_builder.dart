import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/product/widget/custom_card.dart';
import 'package:food_app_ga_coding/viewmodel/cardBuilder_provider.dart';
import 'package:provider/provider.dart';

class cardBuilder extends StatelessWidget {
  const cardBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   ScreenSize().init(context);
    return SizedBox(
      height: ScreenSize.dynamicHeight(value: 0.38),
      child:  ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: context.read<cardBuilderProvider>().items.length,
        itemBuilder: (context,index) {
          CookModel item = context.read<cardBuilderProvider>().items[index];
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: customCard(cookModel:item)
      );}));

  }
}
