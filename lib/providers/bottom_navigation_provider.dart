import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int currentIndex = 0;
  int? searchPageIndex = 0;

  void changePages(int v) {
    searchPageIndex = 0;
    currentIndex = v;
    notifyListeners();
  }

  void showSearchPage(int v) {
    searchPageIndex = v;
    notifyListeners();
  }
}
