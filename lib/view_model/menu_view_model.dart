import 'package:flutter/material.dart';
import '../model/api/menu_api.dart';
import '../model/menu_model.dart';

class MenuViewModel with ChangeNotifier {
  List<MenuModel> _listMenu = [];
  List<MenuModel> get listMenu => _listMenu;

  List<MenuModel> _listSearch = [];
  List<MenuModel> get listSearch => _listSearch;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<List<MenuModel>> getCategories({int? categoryId}) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final menuList = await MenuAPI().getProduct();

      if (categoryId != null) {
        _listMenu =
            menuList.where((menu) => menu.idCategory == categoryId).toList();
      } else {
        _listMenu = menuList;
      }

      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch menu data');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return _listMenu;
  }

  Future<List<MenuModel>> getProduct() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    try {
      final menuList = await MenuAPI().getProduct();
      _listMenu = menuList;
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch menu data');
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
      // ignore: unrelated_type_equality_checks
      if (menu.idMenu == idMenu) {
        return menu;
      }
    }
    return null;
  }
}
