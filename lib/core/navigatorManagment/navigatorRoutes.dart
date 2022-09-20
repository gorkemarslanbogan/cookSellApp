import 'package:flutter/cupertino.dart';

import '../../screens/details.dart';
import '../../screens/main.dart';


class NavigatorRoutes {
  final routes = {
        RoutesName.home.withParaf: (context) =>  Home(),
        RoutesName.details.withParaf: (context) => FoodDetails(),
      };
}

enum RoutesName {
  home,details
}

extension NavigatorRoutesNameExtension on RoutesName {
  String get withParaf => "/$name";
}