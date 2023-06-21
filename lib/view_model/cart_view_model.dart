import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/api/cart_api.dart';
import '../model/cart_model.dart';
import '../model/menu_model.dart';
import '../view/component/costum_snackbar.dart';
import '../view/home/home_screen.dart';

class CartViewModel with ChangeNotifier {
  List<CartModel> _listMenuCart = [];
  List<CartModel> get listMenuCart => _listMenuCart;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  double _totalPrice = 0.0;
  int _quantity = 0;
  String _selectedPaymentMethod = '';
  bool _isTakeAway = false;
  int _tableNumber = 0;

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
        idMenu: '',
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

  void setTakeAwaySelected(bool value) {
    _isTakeAway = value;
    if (value) {
      _tableNumber = 0;
    }
    notifyListeners();
  }

  void setSelectedNumber(int number) {
    _tableNumber = number;
    notifyListeners();
  }

  void setSelectedPaymentMethod(String paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  int getTotalPrice() {
    int totalPrice = 0;
    for (var item in _listMenuCart) {
      int itemTotal = int.parse(item.price) * int.parse(item.qty);
      totalPrice += itemTotal;
    }
    return totalPrice;
  }

  Future<void> checkout(BuildContext context) async {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final String idOrder = timestamp.toString();

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('idOrder', idOrder);
      await prefs.setString('dateTimeOrder', DateTime.now.toString());
      await prefs.setDouble('totalPrice', _totalPrice);
      await prefs.setInt('quantity', _quantity);
      await prefs.setString('selectedPaymentMethod', _selectedPaymentMethod);
      await prefs.setBool('isTakeAway', _isTakeAway);

      // Simpan nomor meja jika memilih dine in
      if (!_isTakeAway) {
        await prefs.setBool('isDineIn', true);
        await prefs.setInt('tableNumber', _tableNumber);
      } else {
        await prefs.setBool('isDineIn', false);
        await prefs.remove('tableNumber');
      }
      print(idOrder);

      // final List<String> cartData =
      //     listMenuCart.map((item) => item.toJson()).toList().cast<String>();
      // await prefs.setStringList('cartData', cartData);
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
