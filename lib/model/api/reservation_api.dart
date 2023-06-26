import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nusameals/model/reservation_model.dart';

class ReservationAPI {
  Future<List<ReservationModel>> getReservation() async {
    var categoryUrl = Uri.parse(
        "https://648867d20e2469c038fda7c1.mockapi.io/nusameals/get_table");
    final response = await http.get(categoryUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ReservationModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Table');
    }
  }
}
