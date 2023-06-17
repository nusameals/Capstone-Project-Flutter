import 'package:flutter/material.dart';

import '../model/api/order_api.dart';
import '../model/order_model.dart';

class MyOrderViewModel extends ChangeNotifier {
  List<MyOrder> _myOrders = [];
  List<MyOrder> get myOrders => _myOrders;

  Future<List<MyOrder>> fetchMyOrders() async {
    try {
      _myOrders = await OrderAPI().fetchMyOrders();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    return _myOrders;
  }
}
