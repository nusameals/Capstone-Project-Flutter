import 'dart:convert';
import 'package:http/http.dart' as http;
import '../menu_model.dart';
import 'api_constants.dart';

class MenuAPI {
  Future<List<MenuModel>> getProduct() async {
    var productUrl = Uri.parse('${ApiConstants.baseUrl}/menus');
    final response = await http.get(productUrl);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final menuList = (jsonData['data'] as List<dynamic>)
          .map((item) => MenuModel.fromJson(item))
          .toList();
      return menuList;
    } else {
      throw Exception('Failed to load Product');
    }
  }
}
