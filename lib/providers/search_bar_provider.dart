import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  void clearController() {
    searchController.clear();
    notifyListeners();
  }
}
