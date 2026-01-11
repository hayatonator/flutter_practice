import 'cart_product.dart';

class CartState {
  List<CartProduct> products;
  bool isCouponApplied;

  int get totalPrice {
    int totalPrice = 0;
    for (CartProduct product in products) {
      totalPrice += product.price;
    }
    if(isCouponApplied) {
      totalPrice = (totalPrice * 0.9).toInt();
    }
    return totalPrice;
  }

  CartState({required this.products, this.isCouponApplied = false});
}