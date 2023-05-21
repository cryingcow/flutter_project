import 'package:flutter/widgets.dart';
import 'package:flutter_application/model/products_model.dart';

class ProductsVM with ChangeNotifier {
  List<ProductModel> lst = [];
  List<ProductModel> flst = [];
  add(ProductModel mo) {
    lst.add(mo);
    notifyListeners();
  }

  del(int index) {
    lst.removeAt(index);
    notifyListeners();
  }

  fadd(ProductModel mo) {
    lst.add(mo);
    notifyListeners();
  }

  fdel(int index) {
    lst.removeAt(index);
    notifyListeners();
  }
}
