import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../order_model.dart';
import 'api_constants.dart';

class OrderAPI {
  Future<Order> createOrder(
      int userId, int menuId, String typeOrder, int quantity) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var orderUrl = Uri.parse('${ApiConstants.baseUrl}/orders');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    final body = {
      'user_id': userId,
      'menu_id': menuId,
      'type_order': typeOrder,
      'quantity': quantity,
    };

    final response =
        await http.post(orderUrl, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Order.fromJson(jsonData);
    } else {
      throw Exception('Failed to create order.');
    }
  }

  Future<List<MyOrder>> fetchMyOrders() async {
    final response = await http.get(Uri.parse(
        'https://64866ce6beba6297278ec7e2.mockapi.io/nusameals/get_myOrder'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonOrders = jsonDecode(response.body);
      return jsonOrders.map((json) => MyOrder.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch my orders');
    }
  }
}
