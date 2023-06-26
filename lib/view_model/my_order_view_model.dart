import 'package:flutter/material.dart';

import '../model/api/order_api.dart';
import '../model/api/payment_api.dart';
import '../model/order_model.dart';
import '../model/payment_model.dart';

class MyOrderViewModel extends ChangeNotifier {
  List<Order> _myOrders = [];
  List<Order> get myOrders => _myOrders;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  int orderId = 0;
  Future<void> createOrder(int userId, int menuId, String typeOrder,
      int quantity, String tableNumber, String paymentMethods) async {
    try {
      final order = await OrderAPI().createOrder(
        userId,
        menuId,
        typeOrder,
        quantity,
        tableNumber,
        paymentMethods,
      );
      orderId = order.id;
      _myOrders.add(order);
      debugPrint('Pesanan berhasil dibuat: ${order.id}');
      print(order.userId);
      print(order.menuId);
      print(order.typeOrder);
      print(order.quantity);
      print(order.tableNumber);
      print(order.paymentMethods);
      print(order.createdAt);
    } catch (error) {
      // ignore: avoid_print
      print('Gagal membuat pesanan: $error');
    }
  }

  Future<void> payments(int orderId, int amount) async {
    try {
      final payment = PaymentModel(
          id: 0,
          orderId: orderId,
          userId: 0,
          username: '',
          totalPrice: 0,
          typeOrder: '',
          tableNumber: '',
          paymentMethods: '',
          amount: amount,
          paymentStatus: '');
      await PaymentAPI().createPayment(payment);
      // ignore: avoid_print
      print('Success Payment');
    } catch (error) {
      // ignore: avoid_print
      print('Failed Payment: $error');
    }
  }

  Future<void> fetchOrders() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      _myOrders = await OrderAPI().getMyOrders();
      notifyListeners();
    } catch (error) {
      print('Failed to fetch orders: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
