import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/imagePathManagment/imagePath.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/CookPrice.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/cookNameText.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/greyTittle.dart';
import 'package:food_app_ga_coding/product/widget/healthCare.dart';


class customListTileCard extends StatelessWidget {
  const customListTileCard({ Key? key, required this.Cookmodel}) : super(key: key);
final CookModel Cookmodel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.3,
      width: MediaQuery.of(context).size.width,
      child:  _containerWidgetItem(cookModel: Cookmodel),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}

class _containerWidgetItem extends StatelessWidget {
  const _containerWidgetItem({
  Key? key, required this.cookModel
  }) : super(key: key);
final CookModel cookModel;
  @override
  Widget build(BuildContext context) {
    List<Widget> item = [
         Expanded(
           child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: cookModel.image.first,
                 ),
         ),
        Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 5,),
            Row(
              children:  [
                GreytTitle(context: context,title: "Dessert"),
                Padding(
                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width *0.32),
                  child:   CookPrice(context:context, price: cookModel.price, color: Colors.amber,),
                )
              ],
            ),
            const Spacer(),
             cookName(context: context,title: cookModel.cookName),
            const Spacer(flex: 3,),
            const healthCare(),
            const Spacer(flex: 5,),
          ],
        )
      ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: item,
    );
  }
}




class _foodImage extends StatelessWidget {
  const _foodImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath.toPng("food1"), height: 100, width: 100,);
  }
}


