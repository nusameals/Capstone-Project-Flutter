import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../cart_model.dart';

class CartAPI {
  Future<List<CartModel>> getCartData() async {
    var getCartUrl = Uri.parse(
        "https://64866ce6beba6297278ec7e2.mockapi.io/nusameals/get_cart");
    final response = await http.get(getCartUrl);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => CartModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch cart data');
    }
  }
}
