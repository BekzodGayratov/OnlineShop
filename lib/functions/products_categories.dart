import 'package:app/components/poductsComponents/products_components.dart';

//! UI da TabBar orqali mahsulot kategoriyalari o'zgarishi uchun.

  List productsName(int index) {
    if (index == 0) {
      return wearableNames;
    } else if (index == 1) {
      return laptopsNames;
    } else if (index == 2) {
      return phoneNames;
    } else {
      return dronesNames;
    }
  }

  List productsImage(int index) {
    if (index == 0) {
      return wearableImages;
    } else if (index == 1) {
      return laptopsImages;
    } else if (index == 2) {
      return phoneImages;
    } else {
      return dronesImages;
    }
  }
