import 'dart:convert';
import '../register_model.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  Future<RegisterResponsModel> login(RegisterRequestModel requestModels) async {
    String url = "http://testing.hopto.org/login";

    // ignore: unused_local_variable
    final respons = await http.post(url as Uri, body: requestModels.toJson());
    if (respons.statusCode == 200 || respons.statusCode == 400) {
      return RegisterResponsModel.formJson(json.decode(respons.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
