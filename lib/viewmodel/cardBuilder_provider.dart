import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/imagePathManagment/imagePath.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:provider/provider.dart';

class cardBuilderProvider with ChangeNotifier {
  List<CookModel> items = [
    CookModel(
        "Easy Tomato",
        "The Most deliciouss in the summer",
        15.99,
        "4.5",
        Image.asset(
          imagePath.toPng("food2"),
          width: 80,
          height: 80,
        )),
    CookModel(
        "Chicken Menu",
        "The Most deliciouss in the summer",
        12.31,
        "4.4",
        Image.asset(
          imagePath.toPng("food3"),
          width: 80,
          height: 80,
        )),
    CookModel(
        "Mixed Salad",
        "The Most deliciouss in the summer",
        09.99,
        "3.8",
        Image.asset(
          imagePath.toPng("food2"),
          width: 80,
          height: 80,
        )),
  ];

  void updateCookTitle(String title) {
    items.first.chanceName = title;
    notifyListeners();
  }
  void updatePrice(double newPrice) {
    items.first.chanceprice = newPrice;
  }
}
