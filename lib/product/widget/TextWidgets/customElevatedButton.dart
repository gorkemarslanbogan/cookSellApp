import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/screens/details.dart';



class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key, required this.title,
  }) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    onPressed: (){}, 
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 25),
      child: Wrap(
        children: [
          Text(title,style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: Colors.white,
          ),),
         const Icon(Icons.keyboard_arrow_right,color: Utility.ColorWhite,)
        ],
      ),
    ),style: OutlinedButton.styleFrom(
      backgroundColor: Colors.teal.shade400,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),);
  }
}