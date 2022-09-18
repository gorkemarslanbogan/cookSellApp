
import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/core/utility/Screen_dynamic_size.dart';
import 'package:food_app_ga_coding/model/cook_model.dart';
import 'package:food_app_ga_coding/viewmodel/customCard_viewmodel.dart';
import 'package:provider/provider.dart';

class customCard extends StatelessWidget with ScreenSize{
  customCard({ Key? key, required this.cookModel}) : super(key: key);
  final color = Colors.cyan.shade900;
  final CookModel cookModel;
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return ChangeNotifierProvider<customCardProvider>(
      builder: (context, child){
       return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        child: Container(
        height: ScreenSize.dynamicHeight(value: 0.35),
        width: ScreenSize.dynamicWidth(value: 0.50),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.elliptical(15, 15)),
        ),
        child: _cardChilds(cookModel: cookModel),
        ),
      );  
      },
      create: (context) => customCardProvider(),
    );
  }
}

class _cardChilds extends StatelessWidget {
   _cardChilds({
    Key? key, required this.cookModel,
  }) : super(key: key);
  final CookModel cookModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardTittleText(title: cookModel.cookName),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, top: 10),
                child: _cardDescription(description: cookModel.cookDescription),
              ),
              _cardStars(score: cookModel.puan),
              const Spacer(),
              _priceTextWidget(price: cookModel.price),
            ],
          ),
        ),
       _cookImage(image: cookModel.image.first),
      ],
    );
  }
}

class _cookImage extends StatelessWidget {
  const _cookImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
     right: -120,
     top: 125,
       child: SizedBox(
        height: ScreenSize.dynamicHeight(value: 0.10),
        width: ScreenSize.dynamicWidth(value: 0.25),
        child: image));
  }
}

class _priceTextWidget extends StatelessWidget {
  const _priceTextWidget({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text("\$${price.toString()}", style: Theme.of(context).textTheme.headline6?.copyWith(
      color: Colors.amber,
    ),);
  }
}

class _cardStars extends StatelessWidget {
   _cardStars({
    Key? key, required this.score,
  }) : super(key: key);

final String score;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.white,size: 20,),
        Text("  "+score, style: Theme.of(context).textTheme.subtitle2?.copyWith(
        color: Colors.white,
      ),),
      ],
    );
  }
}

class _cardDescription extends StatelessWidget {
  const _cardDescription({
    Key? key, required this.description,
  }) : super(key: key);
final String description;
  @override
  Widget build(BuildContext context) {
    return Text(description, style: Theme.of(context).textTheme.subtitle2?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w400
    ),);
  }
}

class _CardTittleText extends StatelessWidget {
  const _CardTittleText({
    Key? key, required this.title,
  }) : super(key: key);
final title;
  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),);
  }
}