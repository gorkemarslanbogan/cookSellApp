import 'package:flutter/material.dart';

class customTextField extends StatelessWidget  {
   const customTextField({Key? key}) : super(key: key);
  static const String hintTexts = "Search anything"; 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            suffixIcon: _filtersButton(),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Colors.black54.withOpacity(0.5),
            ),
            hintText: hintTexts,
            isDense: true,
            contentPadding: const EdgeInsets.all(15)),
      ),
    );
  }


  Widget _filtersButton() {
    return SizedBox(
      width: 40,
      child: ElevatedButton(
          style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10,10))),
              backgroundColor: Colors.teal.shade900),
          onPressed: () {},
          child: const Icon(Icons.format_align_left_sharp)),
    );
  }
}

