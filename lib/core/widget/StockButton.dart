import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/screens/details.dart';

class StockButton extends StatefulWidget {
  const StockButton({Key? key}) : super(key: key);

  @override
  State<StockButton> createState() => _StockButtonState();
}

class _StockButtonState extends State<StockButton> {
  @override
  int value = 1;
  int addValue() {
    value++;
    setState(() {});
    return value;
  }

  int RemoveValue() {
    if (value > 0) {
      value--;
      setState(() {});
      return value;
    } else {
      return 0;
    }
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(35)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              onPressed: () {
                RemoveValue();
              },
              icon: Icon(
                Icons.remove,
                color: Utility.ColorWhite,
                size: 20,
              )),
          Text(
            "$value",
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Utility.ColorWhite,
                  fontSize: 15,
                ),
          ),
          IconButton(
              onPressed: () {
                addValue();
              },
              icon: Icon(
                Icons.add,
                color: Utility.ColorWhite,
                size: 20,
              ))
        ],
      ),
    );
  }
}
