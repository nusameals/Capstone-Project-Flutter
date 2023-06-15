import 'package:flutter/material.dart';
import '../model/api/cart_api.dart';
import '../model/cart_model.dart';
import '../model/menu_model.dart';
import '../view/component/costum_snackbar.dart';

class CartViewModel with ChangeNotifier {
  List<CartModel> _listMenuCart = [];
  List<CartModel> get listMenuCart => _listMenuCart;

  Future<List<CartModel>> getCart() async {
    try {
      List<CartModel> cartData = await CartAPI().getCartData();
      _listMenuCart.addAll(cartData);
      notifyListeners();
    } catch (e) {
      rethrow;
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
        price: menu.price,
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
}
