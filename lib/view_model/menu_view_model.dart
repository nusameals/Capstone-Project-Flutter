import 'package:flutter/material.dart';
import '../model/api/menu_api.dart';
import '../model/menu_model.dart';

class MenuViewModel with ChangeNotifier {
  List<MenuCategory> _categories = [];
  List<MenuCategory> get categories => _categories;

  List<MenuModel> _listMenu = [];
  List<MenuModel> get listMenu => _listMenu;

  List<MenuModel> _listSearch = [];
  List<MenuModel> get listSearch => _listSearch;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<List<MenuCategory>> getCategories() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      _categories = await MenuAPI().getCategories();
      getProduct();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return _categories;
  }

  Future<List<MenuModel>> getProduct() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      _listMenu = await MenuAPI().getProduct();
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return _listMenu;
  }

  void search(String query) {
    _listSearch = listMenu
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void clearSearch() {
    _listSearch.clear();
    notifyListeners();
  }

  MenuModel? findMenuById(String idMenu) {
    for (MenuModel menu in _listMenu) {
      if (menu.idMenu == idMenu) {
        return menu;
      }
    }
    return null;
  }
}
