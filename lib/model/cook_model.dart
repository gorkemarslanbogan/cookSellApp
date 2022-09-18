import 'package:flutter/cupertino.dart';

class CookModel {
 String _name;
 final String _description;
 final String _puan;
 List<Image> image;
 double _price;

CookModel(this._name, this._description, this._price, this._puan,this.image);
  

String get cookName => _name;
String get puan => _puan;
String get cookDescription => _description;
double get price => _price;

set chanceName(String name){
    _name = name;
}

set chanceDescription(String destcription){
    _name = destcription;
}

set chanceprice(double price){
    _price = price;
}




}
