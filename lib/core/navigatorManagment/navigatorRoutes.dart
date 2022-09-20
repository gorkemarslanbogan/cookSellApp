import '../../screens/details.dart';
import '../../screens/main.dart';


class NavigatorRoutes {
  static const paraf = "/";
  final routes = {
        paraf: (context) =>  mainScreen(),
        RoutesName.details.withParaf: (context) => FoodDetails(),
      };
}

enum RoutesName {
  details
}

extension NavigatorRoutesNameExtension on RoutesName {
  String get withParaf => "/$name";
}