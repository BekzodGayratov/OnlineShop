import 'package:flutter/widgets.dart';

class AddToBasketProvider extends ChangeNotifier {
  List<String> addedBasket = [];
  bool isFavorited = false;
  List favoritedItems = [];
  void addToBasket(String v) {
    addedBasket.add(v.toString());
    notifyListeners();
  }

  void favorited(String v) {
    if (isFavorited) {
      isFavorited = !isFavorited;
      favoritedItems.add(v);
    }
    else{
       isFavorited = !isFavorited;
    }
    notifyListeners();
  }
}
