import 'package:flutter/material.dart';
import '../model/api/cart_api.dart';
import '../model/cart_model.dart';

class CartViewModel with ChangeNotifier {
  List<CartModel> _listMenuCart = [];
  List<CartModel> get listMenuCart => _listMenuCart;

  Future<List<CartModel>> getCart() async {
    try {
      _listMenuCart = await CartAPI().getCartData();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    return _listMenuCart;
  }
}
