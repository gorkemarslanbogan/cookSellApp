import 'package:flutter/material.dart';
import 'package:food_app_ga_coding/product/utility/app_padding.dart';


class appbarWidget extends StatelessWidget implements PreferredSizeWidget{
  const appbarWidget({
    Key? key,
  }) : super(key: key);
 @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: appPadding.appbarPadding,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.short_text_outlined), onPressed: (){},),
      ),
      actions: [
        Padding(
          padding:  appPadding.appbarPadding,
          child: IconButton(icon: const Icon(Icons.shopping_bag_outlined), onPressed: (){},),
        ),
      ],
    );
  }

 
}