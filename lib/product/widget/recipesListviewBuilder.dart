import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/product/widget/customListTile.dart';
import 'package:food_app_ga_coding/viewmodel/cardBuilder_provider.dart';
import 'package:provider/provider.dart';



class recipesListBuilder extends StatelessWidget {
  const recipesListBuilder({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: context.read<cardBuilderProvider>().items.length,
          itemBuilder: ((context, index) {
          CookModel items = context.read<cardBuilderProvider>().items[index];
          return Card(
            child: customListTileCard(Cookmodel: items),
          );
        }));
  }
}