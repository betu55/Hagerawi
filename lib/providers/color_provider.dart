import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color color;
  ColorProvider(this.color);

  void changeColor(Color color) {
    this.color = color;
    notifyListeners();
  }

  void changeColor2(Color color) {
    this.color = color;
    notifyListeners();
  }
}
