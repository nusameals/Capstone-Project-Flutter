import 'package:flutter/material.dart';

import '../model/api/order_api.dart';
import '../model/order_model.dart';

class MyOrderViewModel extends ChangeNotifier {
  List<MyOrder> _myOrders = [];
  List<MyOrder> get myOrders => _myOrders;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<List<MyOrder>> fetchMyOrders() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      _myOrders = await OrderAPI().fetchMyOrders();
      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return _myOrders;
  }
}
