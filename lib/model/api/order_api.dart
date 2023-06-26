import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../order_model.dart';
import 'api_constants.dart';

class OrderAPI {
  Future<Order> createOrder(int userId, int menuId, String typeOrder,
      int quantity, String tableNumber, String paymentMethods) async {
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
      'table_number': tableNumber,
      'payment_methods': paymentMethods,
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

  Future<List<Order>> getMyOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('id');
    var getMyOrderUrl =
        Uri.parse('${ApiConstants.baseUrl}/orders/order-details/user/$userId');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };

    final response = await http.get(getMyOrderUrl, headers: headers);

    if (response.statusCode == 200) {
      final dynamic responseData = json.decode(response.body);
      if (responseData != null && responseData is List<dynamic>) {
        final List<Order> orders =
            responseData.map((item) => Order.fromJson(item)).toList();
        return orders;
      } else {
        throw Exception('Invalid response data');
      }
    } else {
      throw Exception('Failed to get orders');
    }
  }
}
