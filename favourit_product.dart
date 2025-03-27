import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritProduct extends ChangeNotifier {
  final List<Product> _favourits = [];
  List<Product> get favourit => _favourits;
  void toggleFav(Product product) {
    if (_favourits.contains(product)) {
      _favourits.remove(product);
      // for (Product ele in _favourits) {
      //   ele.quenty++;
      // }
    } else {
      _favourits.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favourits.contains(product);
    return isExist;
  }

  static FavouritProduct of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavouritProduct>(context, listen: listen);
  }
}
