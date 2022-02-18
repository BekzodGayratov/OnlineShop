import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
  int tabindex = 0;

  void changeIndex(int index) {
    tabindex = index;
    notifyListeners();
  }
}
