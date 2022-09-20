import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/imagePathManagment/imagePath.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';

class cardBuilderProvider extends ChangeNotifier {

  List<CookModel> items = [
    CookModel(
        "Easy Tomato Healthy",
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        15.99,
        "4.5",
        [Image.asset(
          imagePath.toPng("food2"),
        )]),
    CookModel(
        "Chicken Menu",
         "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        12.31,
        "4.4",
        [Image.asset(
          imagePath.toPng("food3"),
        )]),
    CookModel(
        "Mixed Salad",
         "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
        09.99,
        "3.8",
        [Image.asset(
          imagePath.toPng("food2"),
        )]),
  ];

}

