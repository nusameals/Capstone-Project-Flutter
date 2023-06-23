import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../payment_model.dart';
import 'api_constants.dart';

class PaymentAPI {
  Future<void> createPayment(PaymentModel paymentModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var paymentUrl = Uri.parse('${ApiConstants.baseUrl}/payments');
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${prefs.getString('token')}'
    };
    final response = await http.post(
      paymentUrl,
      headers: headers,
      body: jsonEncode(paymentModel.toJson()),
    );

    if (response.statusCode == 200) {
      print('Payment created successfully!');
    } else {
      // Gagal membuat payment
      print('Failed to create payment.');
    }
  }
}
