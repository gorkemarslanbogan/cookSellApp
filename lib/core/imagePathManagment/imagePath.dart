import 'imagePath.dart';

enum imageType { png, jpeg }

class imagePath {
  static String toPng(String path) {
    return "assets/images/${path}.${imageType.png.name}";
  }

  static String toJpeg(String path) {
    return "assets/images/${path}.${imageType.jpeg.name}";
  }
}
