import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/api/cart_api.dart';
import '../model/api/order_api.dart';
import '../model/cart_model.dart';
import '../model/menu_model.dart';
import '../model/order_model.dart';
import '../view/component/costum_snackbar.dart';
import '../view/home/home_screen.dart';

class CartViewModel with ChangeNotifier {
  List<CartModel> _listMenuCart = [];
  List<CartModel> get listMenuCart => _listMenuCart;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _selectedPaymentMethod = '';
  bool _dineInSelected = true;
  bool _takeAwaySelected = false;
  int _totalPrice = 0;

  int _tableNumber = 0;
  int _quantity = 1;
  int get quantity => _quantity;
  bool get dineInSelected => _dineInSelected;
  bool get takeAwaySelected => _takeAwaySelected;
  int get tableNumber => _tableNumber;

  Future<List<CartModel>> getCart() async {
    _isLoading = true;
    notifyListeners();
    try {
      List<CartModel> cartData = await CartAPI().getCartData();
      _listMenuCart.addAll(cartData);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return _listMenuCart;
  }

  void addToCart(MenuModel menu, BuildContext context) {
    bool isAlreadyInCart = _listMenuCart.any((item) => item.name == menu.name);

    if (isAlreadyInCart) {
      CustomSnackbar.showSnackbar(
        context,
        "Menu '${menu.name}' already exists in the cart",
        actionText: 'Close',
        onPressed: () {
          Navigator.pop(context);
        },
      );
    } else {
      CartModel cartItem = CartModel(
        idCart: '',
        idCustomer: '',
        idMenu: menu.idMenu.toString(),
        name: menu.name,
        city: menu.city,
        calorie: menu.calorie,
        images: menu.images,
        price: menu.price.toString(),
        qty: '1',
        cart: '',
        numberTable: '',
      );
      _listMenuCart.add(cartItem);
      CustomSnackbar.showSnackbar(
        context,
        '"${menu.name}" put in basket.',
        actionText: 'Close',
        onPressed: () {
          Navigator.pop(context);
        },
      );
      notifyListeners();
    }
  }

  void selectDineIn() {
    _dineInSelected = true;
    _takeAwaySelected = false;
    notifyListeners();
  }

  void selectTakeAway() {
    _dineInSelected = false;
    _takeAwaySelected = true;
    notifyListeners();
  }

  String get selectedOption {
    if (_dineInSelected) {
      return 'dine in';
    } else if (_takeAwaySelected) {
      return 'take away';
    } else {
      return '';
    }
  }

  void setSelectedNumber(int number) {
    _tableNumber = number;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (_quantity > 1) {
      _quantity--;
      notifyListeners();
    }
  }

  void increaseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void setSelectedPaymentMethod(String paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  int calculateTotal(int price) {
    return _quantity * price;
  }

  int getTotalPrice() {
    for (var item in _listMenuCart) {
      int itemTotal = int.parse(item.price) * int.parse(item.qty);
      _totalPrice += itemTotal;
    }
    return _totalPrice;
  }

  Future<void> createOrder(
      int userId, int menuId, String typeOrder, int quantity) async {
    try {
      final order = await OrderAPI().createOrder(
        userId,
        menuId,
        typeOrder,
        quantity,
      );

      print('Pesanan berhasil dibuat: ${order.id}');
      // print(order.userId);
      // print(order.menuId);
      // print(order.typeOrder);
      // print(quantity);
    } catch (error) {
      print('Gagal membuat pesanan: $error');
    }
  }

  Future<void> checkout(BuildContext context) async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final String idOrder = timestamp.toString();
    DateTime now = DateTime.now();
    // String formattedDateTime = DateFormat('HH:mm/yyyy').format(now);
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('idOrder', idOrder);
      await prefs.setString('dateTimeOrder', now.toString());
      await prefs.setDouble('totalPrice', _totalPrice.toDouble());
      await prefs.setInt('quantity', _quantity);
      await prefs.setString('selectedPaymentMethod', _selectedPaymentMethod);

      List<String> cartData =
          _listMenuCart.map((item) => json.encode(item.toJson())).toList();
      await prefs.setStringList('cartData', cartData);
    } catch (e) {
      print('Error saving order data: $e');
      return;
    }

    listMenuCart.clear();
    // ignore: use_build_context_synchronously
    CustomSnackbar.showSnackbar(
      context,
      'Thanks for order, please wait...',
      actionText: 'Order more',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
    );
  }
}
