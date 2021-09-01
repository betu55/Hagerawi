import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  Color color;
  ColorProvider(this.color);

  void changeColor(Color color) {
    this.color = color;
    notifyListeners();
  }
}
