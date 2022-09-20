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



class FoodDetails extends StatefulWidget {
   FoodDetails({Key? key,  this.model}) : super(key: key);
   CookModel? model;
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0),() async {
     await _FoodDetailsModalBottomSheet(context);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: const _AppBar(),
        body: _FoodDetailsHeader(context),
    );
  }

  Stack _FoodDetailsHeader(BuildContext context) {
    return Stack(
        children:  [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height * 0.64,
            child: _FoodImage(foodModel: widget)),
          Positioned.fill(
            left: MediaQuery.of(context).size.width * 0.78,
            top: MediaQuery.of(context).size.height * 0.24,
            child: CookPrice(context: context, price: widget.model?.price ?? 0, color: Utility.ColorWhite)),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.40,
              top: MediaQuery.of(context).size.height * 0.23,
              child: const StockButton())
        ],
      );
  }


  Future<dynamic> _FoodDetailsModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
            isDismissible: false,
            enableDrag: false,
            barrierColor: Colors.transparent,
            shape:  Utility.showModalBorder,
            context: context, 
            builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.65 ,
              child: Padding(
                padding:  Utility.symetricHorizontalPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GreytTitle(context: context, title: "Healthy Food"),
                    const SizedBox(height: 10,),
                    cookName(context: context, title: "${widget.model?.cookName}"),
                    const SizedBox(height: 20,),
                    CookDescription(context: context, title: "${widget.model?.cookDescription}"),
                    const SizedBox(height: 10,),
                    cookName(context: context, title: "Ingridients"),
                      const SizedBox(height: 70,),
                  const CustomElevatedButton(title: "Order Now",),
                  ],
                ),
              ));
          });
  }
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
        }, icon: const Icon(Icons.arrow_back_rounded, color: Utility.ColorWhite,size: 24,)),
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


class Utility {
 static const appbarPadding = EdgeInsets.symmetric(horizontal: 12.0,vertical: 15);
 static const ColorWhite =  Colors.white;
 static const showModalBorder = RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(35)));
 static const symetricHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0,vertical: 30.0);
}