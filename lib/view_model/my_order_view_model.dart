import 'package:flutter/material.dart';

import '../model/api/order_api.dart';
import '../model/api/payment_api.dart';
import '../model/order_model.dart';
import '../model/payment_model.dart';

class MyOrderViewModel extends ChangeNotifier {
  List<MyOrder> _myOrders = [];
  List<MyOrder> get myOrders => _myOrders;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int orderId = 0;
  Future<void> createOrder(
      int userId, int menuId, String typeOrder, int quantity) async {
    try {
      final order = await OrderAPI().createOrder(
        userId,
        menuId,
        typeOrder,
        quantity,
      );
      orderId = order.id;
      debugPrint('Pesanan berhasil dibuat: ${order.id}');
      // print(order.userId);
      // print(order.menuId);
      // print(order.typeOrder);
      // print(quantity);
    } catch (error) {
      print('Gagal membuat pesanan: $error');
    }
  }

  Future<void> payments(
      int orderId, int userId, double amount, String method) async {
    try {
      final payment = PaymentModel(
        id: 0,
        orderId: orderId,
        userId: userId,
        amount: amount,
        status: '',
        method: method,
        paymentType: '',
      );
      await PaymentAPI().createPayment(payment);
      print('Success Payment');
      // print(payment.orderId);
      // print(payment.userId);
      // print(payment.amount);
      // print(payment.method);
    } catch (error) {
      print('Failed Payment: $error');
    }
  }

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
