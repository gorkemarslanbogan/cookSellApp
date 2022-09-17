import 'package:flutter/cupertino.dart';

class CookModel {
 String _name;
 String _description;
 String _puan;
 Image image;
 double _price;

CookModel(this._name, this._description, this._price, this._puan,this.image);
  

String get cookName => this._name;
String get puan => this._puan;
String get cookDescription => this._description;
double get price => this._price;

void set chanceName(String name){
    this._name = name;
}

void set chanceDescription(String destcription){
    this._name = destcription;
}

void set chanceprice(double price){
    this._price = price;
}




}
