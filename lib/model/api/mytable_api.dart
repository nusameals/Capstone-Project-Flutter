import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nusameals/model/mytable_model.dart';

class MyTableAPI {
  Future<List<MyTable>> getmyTable() async {
    var categoryUrl = Uri.parse(
        "https://648867d20e2469c038fda7c1.mockapi.io/nusameals/get_reservation");
    final response = await http.get(categoryUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => MyTable.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Table');
    }
  }
}
