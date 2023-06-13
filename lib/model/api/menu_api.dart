import 'dart:convert';
import 'package:http/http.dart' as http;
import '../menu_model.dart';

class MenuAPI {
  Future<List<MenuCategory>> getCategories() async {
    var categoryUrl = Uri.parse(
        "https://64866572a795d24810b7e207.mockapi.io/nusameals/get_menu_by_category");
    final response = await http.get(categoryUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => MenuCategory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<MenuModel>> getProduct() async {
    var productUrl = Uri.parse(
        "https://64866572a795d24810b7e207.mockapi.io/nusameals/get_all_menu");
    final response = await http.get(productUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => MenuModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Product');
    }
  }
}
