import 'package:flutter/material.dart';
import '../model/api/cart_api.dart';
import '../model/cart_model.dart';
import '../model/menu_model.dart';
import '../view/component/costum_snackbar.dart';

class CartViewModel with ChangeNotifier {
  // ignore: prefer_final_fields
  List<CartModel> _listMenuCart = [];
  List<CartModel> get listMenuCart => _listMenuCart;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // ignore: unused_field
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
}
