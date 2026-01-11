import 'package:flutter/material.dart';
import 'cart_product.dart';
import 'cart_state.dart';

class CartProvider extends ChangeNotifier {
  final CartState _state = CartState(products: [], isCouponApplied: false);

  CartState get state => _state;

  void addProduct(String name, int price) {
    _state.products.add(CartProduct(id: DateTime.now().toString(), name: name, price: price));
    notifyListeners();
  }

  void removeProduct(CartProduct product) {
    _state.products.remove(product);
    notifyListeners();
  }

  void toggleCoupon(){
    _state.isCouponApplied = !_state.isCouponApplied;
    notifyListeners();
  }
}