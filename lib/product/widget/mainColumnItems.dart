import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/product/utility/text_utility.dart';
import 'package:food_app_ga_coding/product/widget/custom_text_field.dart';
import 'package:food_app_ga_coding/product/widget/horizontal_scrool_card_builder.dart';
import 'package:food_app_ga_coding/product/widget/recipesListviewBuilder.dart';


class columnItems extends StatelessWidget {
  const columnItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        mainTitle(title: textUtility.mainTittle,),
        SizedBox(
          height: 20,
        ),
        customTextField(),
        SizedBox(
          height: 20,
        ),
        textWidget(
          title: textUtility.recommend,
        ),
        cardBuilder(),
        SizedBox(
          height: 10,
        ),
        textWidget(
          title: textUtility.recipes,
        ),
        recipesListBuilder()
      ],
    );
  }
}

class textWidget extends StatelessWidget {
  const textWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}

class mainTitle extends StatelessWidget {
  const mainTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      textUtility.mainTittle,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(color: Colors.black87, fontWeight: FontWeight.w400),
    );
  }
}
