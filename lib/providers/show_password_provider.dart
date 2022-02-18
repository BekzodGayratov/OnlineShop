import 'package:flutter/material.dart';

class ShowPasswordProvider extends ChangeNotifier {
  bool show = true;

  void showPassword() {
    show = !show;
    notifyListeners();
  }
}
