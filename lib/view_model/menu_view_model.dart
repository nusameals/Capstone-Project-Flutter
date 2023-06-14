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

  Future<List<MenuCategory>> getCategories() async {
    try {
      _categories = await MenuAPI().getCategories();
      getProduct();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    return _categories;
  }

  Future<List<MenuModel>> getProduct() async {
    try {
      _listMenu = await MenuAPI().getProduct();
      notifyListeners();
    } catch (e) {
      rethrow;
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
}
