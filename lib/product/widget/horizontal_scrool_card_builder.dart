import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/imagePathManagment/imagePath.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/product/widget/custom_card.dart';


class cardBuilder extends StatelessWidget {
   cardBuilder({ Key? key }) : super(key: key);
List<CookModel> _items = [
  CookModel("Easy Tomato", "The Most deliciouss in the summer", 15.99, "4.1", Image.asset(imagePath.toPng("food2"), width: 80, height: 80,)),
  CookModel("Chicken Menu", "The Most deliciouss in the summer", 12.31, "4.4", Image.asset(imagePath.toPng("food3"), width: 80, height: 80,)),
  CookModel("Mixed Salad", "The Most deliciouss in the summer", 09.99, "3.8", Image.asset(imagePath.toPng("food2"), width: 80, height: 80,)),
];
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return SizedBox(
      height: ScreenSize.dynamicHeight(value: 0.38),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: customCard(title: _items[index].cookName,description: _items[index].cookDescription,price: _items[index].price,score: _items[index].puan,image: _items[index].image),
          );
        },
      ),
    );
  }
}