import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/screens/details.dart';

abstract class FoodDetailsViewModel extends State<FoodDetails> {
@override
  void initState() {
    super.initState();
     Future.microtask(() async {
      final data = ModalRoute.of(context)?.settings.arguments;
       await (data is CookModel) ?  cookModel = data as CookModel? : null;
      setState(() {
      });
    });
  }
  CookModel? cookModel;

}