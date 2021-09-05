import 'package:flutter/material.dart';

class BottomIndexProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setIndex(int index) {
    if (index != _index) {
      _index = index;
      notifyListeners();
    }
  }
}
