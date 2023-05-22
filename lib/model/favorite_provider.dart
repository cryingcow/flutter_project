import 'package:flutter/material.dart';
import 'package:flutter_application/model/products_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ProductModel> _favorite = [];
  List<ProductModel> get favorites => _favorite;
  void toggleFavorite(ProductModel pd) {
    final isExist = _favorite.contains(pd);
    if (isExist) {
      _favorite.remove(pd);
    } else {
      _favorite.add(pd);
    }
    notifyListeners();
  }

  bool isExist(ProductModel pd) {
    final isExist = _favorite.contains(pd);
    return isExist;
  }
}
