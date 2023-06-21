import 'dart:convert';
import 'package:http/http.dart' as http;
import '../order_model.dart';

class OrderAPI {
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
