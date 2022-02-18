import 'package:flutter/material.dart';

class SearchBarProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  Set<String> searchedItems = {};
  bool itemFound = true;

  void clearController() {
    searchController.clear();
    notifyListeners();
  }

  void addSearchedItems(String item) {
    searchedItems.add(item);
    notifyListeners();
  }

  void cleanSearchedItems() {
    searchedItems.clear();
    notifyListeners();
  }

  void notFoundItems() {
    itemFound = !itemFound;
    notifyListeners();
  }
}
