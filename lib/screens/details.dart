import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/imagePathManagment/imagePath.dart';
import 'package:food_app_ga_coding/core/widget/StockButton.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/CookDescription.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/CookPrice.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/cookNameText.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/customElevatedButton.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/greyTittle.dart';
import 'package:food_app_ga_coding/screens/main.dart';

import '../product/widget/TextWidgets/addToCardIconButton.dart';


class FoodDetails extends StatefulWidget {
   FoodDetails({Key? key,  this.model}) : super(key: key);
   CookModel? model;
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: const _AppBar(),
        body: Stack(
          children:  [
            Positioned.fill(
              bottom:MediaQuery.of(context).size.height * 0.65,
              child: _FoodImage(foodModel: widget)),
            Positioned.fill(
              left: MediaQuery.of(context).size.width * 0.78,
              top: MediaQuery.of(context).size.height * 0.24,
              child: CookPrice(context: context, price: widget.model?.price ?? 0, color: Utility.ColorWhite)),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.40,
                top: MediaQuery.of(context).size.height * 0.23,
                child: StockButton()),
                Positioned.fill(
                  top: MediaQuery.of(context).size.height * 0.32,
                  child: foodInfoContainer(widget: widget))
          ],
        ),
    );
  }
}


class _OrderAddButtons extends StatelessWidget {
  const _OrderAddButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 8,
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomElevatedButton(title: "Order Now",),
          )),
        Expanded(
          flex: 2,
          child: addToCardButton()),
          
      ],
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding:  Utility.appbarPadding,
        child: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const mainScreen())));
        }, icon: const Icon(Icons.arrow_back_ios_rounded, color: Utility.ColorWhite,size: 24,)),
      ),
      actions: [
        Padding(
          padding: Utility.appbarPadding,
          child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined, color: Utility.ColorWhite,size: 24,)),
        )
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FoodImage extends StatelessWidget {
  const _FoodImage({
    Key? key,
    required this.foodModel,
  }) : super(key: key);

  final FoodDetails foodModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2),blurStyle: 
        BlurStyle.normal,blurRadius: 10.0,spreadRadius: 10.0)]
      ),
      height: MediaQuery.of(context).size.height * 0.33,
      child: Center(child: (foodModel.model?.image.first == null) ? Image.asset(imagePath.toPng("food2")) : foodModel.model?.image.first));
  }
}

class foodInfoContainer extends StatelessWidget {
  const foodInfoContainer({Key? key, required this.widget}) : super(key: key);
  final FoodDetails widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: Utility.showModalBorder
      ),
      child: _FoodInfoContainerChild(widget: widget),
    );
  }
}

class _FoodInfoContainerChild extends StatelessWidget {
  const _FoodInfoContainerChild({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final FoodDetails widget;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  Utility.symetricHorizontalPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: GreytTitle(context: context, title: "Healthy Food")),
          Expanded(
            flex: 1,
            child: cookName(context: context, title: "${widget.model?.cookName}")),
          Expanded(
            flex: 2,
            child: CookDescription(context: context, title: "${widget.model?.cookDescription}")),
          cookName(context: context, title: "Ingridients"),
             Expanded(
              flex: 3,
              child: SizedBox(
                child: GridView.builder(
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10
                  ),
                  itemBuilder: ((context, index) {
                   return  Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 4),
                     child: Container(
                      height: 25,
                      width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        child: Image.asset(imagePath.toPng("food2"),fit: BoxFit.contain),
                      ),
                   );
                
                  }),
                  ),
              )),
         const Expanded(
          flex: 2,
          child: _OrderAddButtons())
        ],
      ),
    );
  }
}
class Utility {
 static const appbarPadding = EdgeInsets.symmetric(horizontal: 12.0,vertical: 15);
 static const ColorWhite =  Colors.white;
 static const showModalBorder = BorderRadius.vertical(top: Radius.circular(35));
 static const symetricHorizontalPadding = EdgeInsets.only(left: 25.0, right: 25.0, top: 25);
}