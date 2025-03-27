import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  void toggleFav(Product product) {
    if (_cart.contains(product)) {
      for (Product ele in _cart) {
        ele.quenty++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  incQnt(int index) => _cart[index].quenty++;
  decQnt(int index) => _cart[index].quenty--;

  totalPrice() {
    double total1 = 0.0;
    for (Product ele in _cart) {
      total1 += ele.price * ele.quenty;
    }
    return total1;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
