import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/imagePathManagment/imagePath.dart';
import 'package:food_app_ga_coding/core/widget/StockButton.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/CookDescription.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/CookPrice.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/cookNameText.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/customElevatedButton.dart';
import 'package:food_app_ga_coding/product/widget/TextWidgets/greyTittle.dart';
import 'package:food_app_ga_coding/main.dart';
import 'package:food_app_ga_coding/viewmodel/FoodDetailsViewModel.dart';
import '../product/widget/TextWidgets/addToCardIconButton.dart';

class FoodDetails extends StatefulWidget {
  FoodDetails({Key? key, this.model}) : super(key: key);
  CookModel? model;
  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends FoodDetailsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      backgroundColor: Colors.blueGrey.shade900,
      body: Stack(
        children: [
          Positioned.fill(
              bottom: MediaQuery.of(context).size.height * 0.63,
              child: _FoodImage(cooKModel: cookModel ?? Utility.nullCookModel)),
          Positioned.fill(
              left: MediaQuery.of(context).size.width * 0.78,
              top: MediaQuery.of(context).size.height * 0.24,
              child: CookPrice(
                  context: context,
                  price: widget.model?.price ?? 0,
                  color: Utility.ColorWhite)),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.40,
              top: MediaQuery.of(context).size.height * 0.23,
              child: const StockButton()),
          Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.32,
              child: foodInfoContainer(model: cookModel ?? Utility.nullCookModel))
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomElevatedButton(
                title: "Order Now",
              ),
            )),
        Expanded(flex: 2, child: addToCardButton()),
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
      toolbarHeight: MediaQuery.of(context).size.height *0.08,
      leading: Padding(
        padding: Utility.appbarPadding,
        child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const Home())));
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Utility.ColorWhite,
              size: 24,
            )),
      ),
      actions: [
        Padding(
          padding: Utility.appbarPadding,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Utility.ColorWhite,
                size: 24,
              )),
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
    required this.cooKModel,
  }) : super(key: key);

  final CookModel cooKModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurStyle: BlurStyle.normal,
              blurRadius: 10.0,
              spreadRadius: 10.0)
        ]),
        height: MediaQuery.of(context).size.height * 0.33,
        child:Center(child: cooKModel.image.first));
  }
}

class foodInfoContainer extends StatelessWidget {
  const foodInfoContainer({Key? key, required this.model}) : super(key: key);
  final CookModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: const BoxDecoration(
          color: Colors.white, borderRadius: Utility.showModalBorder),
      child: _FoodInfoContainerChild(model: model),
    );
  }
}

class _FoodInfoContainerChild extends StatelessWidget {
  const _FoodInfoContainerChild({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CookModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utility.symetricHorizontalPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: GreytTitle(context: context, title: "Healthy Food")),
          Expanded(
              flex: 1,
              child: cookName(context: context, title: model.cookName)),
          Expanded(
              flex: 3, child: CookDescription(context: context, title: model.cookDescription)),
          cookName(context: context, title: "Ingridients"),
          const Expanded(flex: 3, child: _IngridientsPhotoGridBuilder()),
          const Expanded(flex: 2, child: _OrderAddButtons())
        ],
      ),
    );
  }
}

class _IngridientsPhotoGridBuilder extends StatelessWidget {
  const _IngridientsPhotoGridBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 10),
        shrinkWrap: true,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, 
            childAspectRatio: MediaQuery.of(context).size.height *0.8 /MediaQuery.of(context).size.width *0.9 ),
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.15),
              ),
              child: Image.asset(imagePath.toPng("food2"), fit: BoxFit.contain),
            ),
          );
        }),
      ),
    );
  }
}

class Utility {
  static const appbarPadding = EdgeInsets.symmetric(horizontal: 12.0, vertical: 15);
  static const ColorWhite = Colors.white;
  static const showModalBorder = BorderRadius.vertical(top: Radius.circular(35));
  static const symetricHorizontalPadding = EdgeInsets.only(left: 25.0, right: 25.0, top: 25);
  static final  nullCookModel = CookModel("", "", 0, "", [Image.asset(imagePath.toPng("food2"))]);
}
