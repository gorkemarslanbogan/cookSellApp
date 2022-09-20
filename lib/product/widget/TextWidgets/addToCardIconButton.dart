import 'package:flutter/material.dart';



class addToCardButton extends StatelessWidget {
  const addToCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.shopping_bag_outlined,color: Colors.black54,),
      onPressed: (){},
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
        
      ),
    );
  }
}